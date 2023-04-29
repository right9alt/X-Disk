// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import Dropzone from 'dropzone'
import 'dropzone/dist/dropzone.css'

document.addEventListener('turbolinks:load', () => {
  const form = document.querySelector('.dropzone')

  if (form) {
    const dropzone = new Dropzone(form, {
      paramName: 'file', // имя параметра, который будет отправляться на сервер
      maxFilesize: 4, // максимальный размер файла в мегабайтах
      acceptedFiles: '.docx, .xls, .zip', // допустимые форматы файлов
      dictDefaultMessage: 'Перетащите файлы сюда или нажмите для выбора', // текст по умолчанию
      dictFallbackMessage: 'Ваш браузер не поддерживает загрузку файлов через drag and drop', // сообщение для старых браузеров
      dictFileTooBig: 'Файл слишком большой (максимальный размер {{maxFilesize}}MB)', // сообщение, когда файл слишком большой
      dictInvalidFileType: 'Формат файла недопустим. Допустимые форматы: {{acceptedFiles}}', // сообщение, когда файл имеет недопустимый формат
      dictResponseError: 'Сервер вернул ошибку {{statusCode}}', // сообщение, когда сервер вернул ошибку
      dictCancelUpload: 'Отменить загрузку', // текст на кнопке отмены загрузки
      dictCancelUploadConfirmation: 'Вы действительно хотите отменить загрузку?', // сообщение с подтверждением отмены загрузки
      dictRemoveFile: 'Удалить файл', // текст на кнопке удаления файла
      dictRemoveFileConfirmation: true // сообщение с подтверждением удаления файла (null - без подтверждения)
    })
  }
})