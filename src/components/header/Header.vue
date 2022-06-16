<template>
    <div>
        <button @click="colorInverter" class="btn btn-primary me-4" >inverter colors</button>
        <button @click="fontUpButtonClick" class="btn btn-primary me-2 " >increase</button>
        <button @click="fontResetButtonClick" class="btn btn-primary me-2" > reset </button>
        <button @click="fontDownButtonClick" class="btn btn-primary" >increase</button>
    </div>
</template>

<script >
import useFontResizer from "../font-resizer/useFontResizer";
export default{
    name:"Header" , 
    setup(){
       return useFontResizer();
    },
}
</script>