
<template>
<div>
    hello from test component
    {testProp}
</div>
</template>

<script>
    export default {
        name: 'test',
        props : {
            testProp : {
                type : String , 
            }
        } ,
        mounted(){
            console.log(this.testProp)
        }
    }
</script>
