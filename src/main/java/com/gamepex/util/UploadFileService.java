package com.gamepex.util;

import java.io.File;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class UploadFileService {

	public String upload(MultipartFile file) {
		// register.jsp에서 첨부 파일명을 AdminBookController로 전달(MultipartFile 객체)하고, UploadFileService의 upload()로 전달한다.(upload(MultipartFile file)는 register.jsp에서 전달한 첨부 파일명을 file 변수로 받는다.)
		boolean result = false;
		
		String fileOriName = file.getOriginalFilename();
		// 클라이언트가 업로드한 첨부 파일명을 변경하기 위해 '원본 파일명'을 얻는다.
		String fileExtension = fileOriName.substring(fileOriName.lastIndexOf("."), fileOriName.length());
		// 문자열.substring(인덱스 번호, 개수)는 인덱스 번호에서 시작해서 개수만큼의 문자열을 얻는다.
		// register.jsp에서 업로드한 원본 파일의 확장자를 얻어 fileExtension 변수에 저장한다.
		String uploadDir = "Z:\\{ 프로젝트 기반 풀스택 개발자 양성 과정 }\\A조 Apex\\project\\upload\\";
		// 첨부 파일의 업로드 경로를 지정한다.
		
		UUID uuid = UUID.randomUUID();
		// ★UUID 클래스의 randomUUID()를 사용하여 식별자(중복 없는 랜덤한 값)를 얻는다.
		// ★첨부 파일명의 덮어쓰기 방지를 위해 중복 없는 랜덤한 값을 얻는다.
		String uniqueName = uuid.toString().replaceAll("-", "");
		// 문자열.replaceAll(선택문자열, 변경문자열)는 선택 문자열을 변경 문자열로 모두 변경한다.
		// 중복 없는 랜덤한 값(식별자)의 '-'를 모두 제거한다.
		
		File saveFile = new File(uploadDir + "\\" + uniqueName + fileExtension);
		// 첨부 파일의 저장 경로와 첨부 파일명(중복 없는 랜덤한 값), 첨부 파일 확장자를 사용하여 File 객체를 생성한다.(File 객체(디렉토리 생성, 파일 저장)로 파일 입출력을 구현한다.)
		if (!saveFile.exists()) saveFile.mkdirs();
		// 만약 첨부 파일이 저장되는 디렉토리가 없다면, 디렉토리를 생성한다.
		try {
			file.transferTo(saveFile); // 첨부 파일을 저장한다.
			result = true;
		}
		catch (Exception e) { e.printStackTrace(); }
		
		if (result) { // 첨부 파일 업로드 성공
			System.out.println("========== FILE UPLOAD SUCCESS!!");
			return uniqueName + fileExtension; // 업로드에 성공한 첨부 파일명을 반환한다.
		} else { // 첨부 파일 업로드 실패
			System.out.println("========== FILE UPLOAD FAIL!!");
			return null;
		}
		
	}
	
}
