import {ref , onMounted } from "vue"
export default function useComposite(){
    
    const count = ref(0);
    const repositories = ref([])

    const initCount = ()=> count.value++;
    onMounted(()=>{
        initCount();
        console.log("mounted 1")
    })
    return { count , initCount , repositories}
}