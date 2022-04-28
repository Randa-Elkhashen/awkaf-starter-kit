import {onMounted, ref} from "vue"
const usePhotoPicker = ()=>{
    const photoInput = ref(null);
    const photoElement = ref(null);
    const photoSrc = ref(undefined);
    const photoFile = ref(undefined);
    const selectPhoto = ()=>{
        photoInput.value.click();
    }
    const onPhotoInputChange = ()=>{
        photoSrc.value =  photoInput.value.value
        photoFile.value = photoInput.value.files[0];
        console.log(photoSrc.value)
        console.log(photoFile.value)
        showSelectedPhoto();
    }
    const showSelectedPhoto = ()=>{
        photoElement.value.file = photoFile.value;
        const reader = new FileReader();
        reader.onload = function(e) { 
            photoSrc.value = e.target.result; 
        };
        reader.readAsDataURL(photoElement.value.file);
    }
    onMounted(()=>{
        photoInput.value.addEventListener('change' , onPhotoInputChange );
        photoElement.value.addEventListener('click' , selectPhoto);
    })
    return {
        photoInput ,
        photoElement ,
        photoSrc ,
        photoFile ,
    }
}
export default usePhotoPicker;

