package com.gamepex.util;

import java.io.InputStream;
import java.util.UUID;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.google.auth.oauth2.ServiceAccountCredentials;
import com.google.cloud.storage.BlobId;
import com.google.cloud.storage.BlobInfo;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;

@Component
public class GcsUploader {

    private final ServletContext servletContext;
    private Storage storage;

    private final String bucketName = "gamepex";

    public GcsUploader(ServletContext servletContext) {
        this.servletContext = servletContext;
    }

    @PostConstruct
    public void init() throws Exception {
        try (InputStream in = servletContext.getResourceAsStream("/WEB-INF/keys/gcp-sa.json")) {
            if (in == null) {
                throw new IllegalStateException("gcp-sa.json not found");
            }
            this.storage = StorageOptions.newBuilder()
                    .setCredentials(ServiceAccountCredentials.fromStream(in))
                    .build()
                    .getService();
        }
    }

    public String upload(MultipartFile file) throws Exception {
        String original = file.getOriginalFilename();
        String ext = "";

        if (original != null) {
            int dot = original.lastIndexOf('.');
            if (dot >= 0) ext = original.substring(dot);
        }

        String objectName = UUID.randomUUID() + ext;

        BlobId blobId = BlobId.of(bucketName, objectName);
        BlobInfo blobInfo = BlobInfo.newBuilder(blobId)
                .setContentType(file.getContentType())
                .build();

        storage.create(blobInfo, file.getBytes());

        return "https://storage.googleapis.com/" + bucketName + "/" + objectName;
    }
}