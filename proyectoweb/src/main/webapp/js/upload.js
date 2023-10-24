const UPLOAD = {
    BASE_PATH: window.location.origin,
    ACCEPTED_DOC_MIMES: [
        "image/png",
        "image/jpeg",
        "application/pdf",
        "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
        "application/msword"
    ],
    DOC_MIMES: [
        "application/pdf",
        "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
        "application/msword"
    ],
    FileInputs: [...document.querySelectorAll("input[type='file']")],
    Init: () => {
        UPLOAD.AddEventListeners();
    },
    AddEventListeners: () => {
        UPLOAD.FileInputs.map((fileInput) => {
            fileInput.addEventListener("change", UPLOAD.HandleFileChange);
        });

        UPLOAD.FileInputs.map((fileInput) => {
            fileInput.addEventListener("blur", (e) => {
                // console.log(e.target);
            });
        });

        UPLOAD.FileInputs.map((fileInput) => {
            const box = fileInput.closest(".uk-placeholder");
            box.addEventListener(
                "dragover",
                (e) => {
                    e.preventDefault();
                    e.stopPropagation();
                    box.classList.add("uk-box-shadow-medium");
                },
                false
            );
        });

        UPLOAD.FileInputs.map((fileInput) => {
            const box = fileInput.closest(".uk-placeholder");
            box.addEventListener(
                "dragleave",
                (e) => {
                    e.preventDefault();
                    e.stopPropagation();
                    box.classList.remove("uk-box-shadow-medium");
                },
                false
            );
        });

        UPLOAD.FileInputs.map((fileInput) => {
            const box = fileInput.closest(".uk-placeholder");
            box.addEventListener(
                "drop",
                (e) => {
                    e.preventDefault();
                    e.stopPropagation();
                    box.classList.remove("uk-box-shadow-medium");

                    const dropZone = e.target.closest(".drop__zone");
                    const componentContainer = dropZone.closest(".uk-upload-box");
                    let preview, alertBox, alertMsg;

                    preview = dropZone.querySelector(`#preview`);
                    alertBox = componentContainer.querySelector(`#error-alert`);
                    alertMsg = componentContainer.querySelector(`#error-messages`);

                    let files;
                    let isMultiple = false;

                    if (fileInput.hasAttribute("multiple")) {
                        isMultiple = true;
                    }

                    if (!e.dataTransfer.files.length) return;

                    /** If items dropped are more than one file and the input doesn't accept multiple, do not accept the files. Clear preview field, show notification and add shake animatin to dropzone */
                    if (isMultiple === false && e.dataTransfer.files.length > 1) {
                        UPLOAD.RemoveChild(preview);
                        UPLOAD.AddShakeAnimation(dropZone);

                        UIkit.notification({
                            message: "Cannot accept multiple files when expecting a single file!",
                            status: "danger",
                            pos: "center",
                            timeout: 4000
                        });
                        return;
                    }

                    files = e.dataTransfer.files;
                    fileInput.files = files;

                    const options = {
                        isMultiple,
                        files,
                        preview,
                        alertBox,
                        alertMsg,
                        fileInput,
                        dropZone
                    };

                    if (isMultiple) {
                        UPLOAD.PreviewMultipleDocs(options);
                    } else {
                        UPLOAD.PreviewSingleDoc(options);
                    }
                },
                false
            );
        });
    },
    Reset: (e) => {
        if (e.target.files.length == 0) {
            const alertWrapper = e.target.closest("#error-alert");
            let alertMessage = alertWrapper.querySelector("#error-messages");
            alertWrapper.classList.add("uk-hidden");
            alertMessage.textContent = "";
            input.value = "";
            return;
        }
    },
    AddShakeAnimation: (parent) => {
        let timeout;
        clearTimeout(timeout);
        parent.classList.add("uk-animation", "uk-animation-shake");
        timeout = setTimeout(() => {
            parent.classList.remove("uk-animation", "uk-animation-shake");
        }, 1000);
    },
    HandleFileChange: (e) => {
        let files;
        let isMultiple = false;

        if (e.target.hasAttribute("multiple")) {
            isMultiple = true;
        }

        const dropZone = e.target.closest(".drop__zone");
        const componentContainer = dropZone.closest(".uk-upload-box");
        const documentCategory = dropZone.dataset.documentCategory;
        let preview, alertBox, alertMsg;
        preview = dropZone.querySelector(`#preview`);
        alertBox = componentContainer.querySelector(`#error-alert`);
        alertMsg = componentContainer.querySelector(`#error-messages`);

        /** Remove existing files and preview files if files lenght is 0 */
        if (!e.target.files.length) {
            UPLOAD.RemoveChild(preview);
            return;
        }

        files = e.target.files;
        const options = {
            files,
            fileInput: e.target,
            isMultiple,
            preview,
            alertBox,
            alertMsg,
            dropZone
        };

        if (isMultiple) {
            UPLOAD.PreviewMultipleDocs(options);
        } else {
            UPLOAD.PreviewSingleDoc(options);
        }
    },
    RemoveChild: (preview) => {
        while (preview.firstChild) {
            preview.removeChild(preview.firstChild);
        }
    },
    ImgPreviewLi: (readerResult, filename) => {
        const li = document.createElement("li");
        const div = document.createElement("div");
        const img = document.createElement("img");
        const span = document.createElement("span");

        li.className = "list-item uk-margin-medium-top";
        div.className = "uk-cover-container";
        img.setAttribute("id", "img-preview-responsive");
        img.setAttribute("src", readerResult);
        img.setAttribute("data-name", filename);
        img.setAttribute("alt", "file-image-preview");
        span.className = "uk-text-meta uk-text-break file-upload-name";
        span.textContent = filename;

        div.append(img);
        li.append(div, span);
        return li;
    },
    ValidateFileType: ({
                           fileType,
                           fileInput,
                           alertBox,
                           alertMsg,
                           preview,
                           dropZone
                       }) => {
        if (!UPLOAD.ACCEPTED_DOC_MIMES.includes(fileType)) {
            alertMsg.textContent =
                "Sorry, one or more of your file type is not allowed.";
            alertMsg.classList.add("uk-text-danger");
            alertBox.classList.remove("uk-hidden");
            fileInput.value = "";
            UPLOAD.AddShakeAnimation(dropZone);
            UPLOAD.RemoveChild(preview);
            return false;
        }
        return true;
    },
    ValidateFileSize: ({
                           fileInput,
                           size,
                           alertBox,
                           alertMsg,
                           preview,
                           dropZone
                       }) => {
        if (size > 2000000) {
            alertMsg.textContent =
                "Sorry, one or more of your files has exceeded the file size limit of 2MB.";
            alertMsg.classList.add("uk-text-danger");
            alertBox.classList.remove("uk-hidden");
            fileInput.value = "";
            UPLOAD.AddShakeAnimation(dropZone);
            UPLOAD.RemoveChild(preview);
            return false;
        }
        return true;
    },
    PreviewMultipleDocs: ({
                              files,
                              fileInput,
                              preview,
                              alertBox,
                              alertMsg,
                              dropZone
                          }) => {
        const docFiles = [...files];

        docFiles.forEach((file) => {
            const size = file["size"];
            const fileType = file["type"];

            if (docFiles.length !== 0) {
                UPLOAD.RemoveChild(preview);
            }

            const fileOptions = {
                fileInput,
                preview,
                alertBox,
                alertMsg,
                fileType,
                size,
                dropZone
            };

            if (!UPLOAD.ValidateFileSize(fileOptions)) return;

            if (!UPLOAD.ValidateFileType(fileOptions)) return;

            alertMsg.textContent = "";
            alertBox.classList.add("uk-hidden");
            fileInput.files = files;
            const reader = new FileReader();
            reader.readAsDataURL(file);
            reader.onload = () => {
                let filename = file["name"];
                let imgPreview = "";
                if (UPLOAD.DOC_MIMES.includes(fileType)) {
                    if (fileType === "application/pdf") {
                        imagePath = `${UPLOAD.BASE_PATH}/assets/images/doc/pdf.svg`;
                        imgPreview = UPLOAD.ImgPreviewLi(imagePath, filename);
                    } else {
                        imagePath = `${UPLOAD.BASE_PATH}/assets/images/doc/docx.svg`;
                        imgPreview = UPLOAD.ImgPreviewLi(imagePath, filename);
                    }
                } else {
                    imgPreview = UPLOAD.ImgPreviewLi(reader.result, filename);
                }
                preview.append(imgPreview);
            };
        });
    },
    PreviewSingleDoc: ({
                           files,
                           fileInput,
                           preview,
                           alertBox,
                           alertMsg,
                           dropZone
                       }) => {
        const size = files[0]["size"];
        const fileType = files[0]["type"];
        let filename = files[0]["name"];

        if (files[0].length !== 0) {
            UPLOAD.RemoveChild(preview);
        }

        const fileOptions = {
            fileInput,
            preview,
            alertBox,
            alertMsg,
            fileType,
            size,
            dropZone
        };

        if (!UPLOAD.ValidateFileSize(fileOptions)) return;

        if (!UPLOAD.ValidateFileType(fileOptions)) return;

        alertMsg.textContent = "";
        alertBox.classList.add("uk-hidden");

        const reader = new FileReader();
        reader.readAsDataURL(files[0]);
        reader.onload = () => {
            let imgPreview = "";
            let imagePath = "";
            if (UPLOAD.DOC_MIMES.includes(fileType)) {
                if (fileType === "application/pdf") {
                    imagePath = `${UPLOAD.BASE_PATH}/assets/images/doc/pdf.svg`;
                    imgPreview = UPLOAD.ImgPreviewLi(imagePath, filename);
                } else {
                    imagePath = `${UPLOAD.BASE_PATH}/assets/images/doc/docx.svg`;
                    imgPreview = UPLOAD.ImgPreviewLi(imagePath, filename);
                }
            } else {
                imgPreview = UPLOAD.ImgPreviewLi(reader.result, filename);
            }
            preview.append(imgPreview);
        };
    }
};

document.addEventListener("DOMContentLoaded", UPLOAD.Init());
