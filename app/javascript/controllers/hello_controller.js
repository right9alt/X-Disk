import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.element.textContent = "Hello World!"
  }
}
function upload_process(){
  var allowedExtensions = [".docx", ".zip", ".xlsx"];
  var fileInput = this;
  var fileName = fileInput.value;
  if (fileName) {
    var extension = fileName.substring(fileName.lastIndexOf(".")).toLowerCase();
    if (!allowedExtensions.includes(extension)) {
      alert("Недопустимый формат файла. Допустимые расширения: " + allowedExtensions.join(", "));
      fileInput.value = null;
      return;
    }
    var fileSize = fileInput.files[0].size; // размер файла в байтах
    var availableSpace = document.getElementById("available-space").dataset.space;
    if (fileSize > availableSpace) {
      alert("Недостаточно места на диске для загрузки файла.");

      fileInput.value = null;
      return;
    }
    var maxFileSize = 4 * 1024 * 1024; // максимальный размер файла (в байтах)
    if (fileSize > maxFileSize) {
      alert("Файл превышает максимально допустимый размер (4 МБ).");
      fileInput.value = null;
      return;
    }
  }
}
function loop()
{
  document.getElementById("upload-file").addEventListener("change", upload_process);
}
document.addEventListener("turbo:load", loop);
loop();
 
  