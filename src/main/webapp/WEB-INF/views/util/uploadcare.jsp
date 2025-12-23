<link
  rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/@uploadcare/file-uploader@1/web/uc-file-uploader-regular.min.css"
>
<script type="module">
  import * as UC from 'https://cdn.jsdelivr.net/npm/@uploadcare/file-uploader@1/web/uc-file-uploader-regular.min.js';
  UC.defineComponents(UC);
</script>

<uc-config
  ctx-name="my-uploader"
  use-cloud-image-editor="false"
  source-list="local"
  files-view-mode="grid"
  pubkey="305fb7c6f21a0407fe17"
></uc-config>

<uc-file-uploader-regular
  ctx-name="my-uploader"
  class="uc-light"
></uc-file-uploader-regular>

<uc-upload-ctx-provider ctx-name="my-uploader"></uc-upload-ctx-provider>

<script>
  const input = document.getElementById('imageUrl');
  const ctx = document.querySelector('uc-upload-ctx-provider[ctx-name="my-uploader"]');

  ctx.addEventListener('file-upload-success', function (e) {
    const url = e.detail.cdnUrl;
    input.value = input.value ? (input.value + ',' + url) : url;
  });
</script>