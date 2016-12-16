<template>
  <div id="loading">
    <div class="center-animation">
      <div class="circle-parent">
        <div class="line"></div>
        <div class="circle circle-left"></div>
        <div class="circle circle-right"></div>
      </div>
      <div class="logo-img">
        <img v-bind:src="imageUrl" >
        <span>Loading</span>
      </div>
    </div>

  </div>
</template>

<script>
  export default({
    props: {
      imageUrl: { type: String, default: 'http://cn.vuejs.org/images/logo.png' }
    }
  })
</script>

<style scoped>
  #loading{
    background: rgba(62, 126, 134, 1);
    width: 100%;
    height: 100%;
    position: fixed;
    top: 0px;
    right: 0px;
    z-index: 9999;
  }
  .center-animation{
    color: #fff;
    width: 300px;
    height: 300px;
    margin: 15% auto;
    position: relative;
    padding: 80px;
  }
  .logo-img{
    width: 100%;
    height: 100%;
    border-radius: 50%;
    overflow: hidden;
    background: #ccc;
  }
  .logo-img span{
    position: absolute;
    font-size: 22px;
    font-weight: bold;
    left: 0px;
    bottom: 35px;
    width: 100%;
    display: inline-block;
    text-align: center;
    animation: opacity 2s infinite linear;
  }
  .logo-img img{
    object-fit: cover;
    width: 140px;
    height: 140px;
  }
  .circle-parent{
    position: absolute;
    width: 100%;
    height: 100%;
    left: 0px;
    top: 0px;
    animation: spin 7s infinite linear;
  }
  .circle-parent .line{
    width: 100%;
    height: 100%;
    border: 5px dashed #fff;
    position: absolute;
    top: 0px;
    left: 0px;
    border-radius: 50%;
    animation: spin 7s infinite linear;
    opacity: 0.3
  }
  .circle{
    border-radius: 50%;
    height: 60px;
    width: 60px;
    position: absolute;
    /*box-shadow:0 0 30px 5px rgba(255,255,255,.1) inset;*/
  }
  .circle-left{
    background: #500062;
    left: 15px;
    bottom: 15px;
  }
  .circle-right{
    background: #842261;
    right: 15px;
    top: 15px;
  }
  @keyframes opacity{
    0%{opacity: 0.9}
    20%{opacity: 0.7}
    50%{opacity: 0.5}
    70%{opacity: 0.3}
    90%{opacity: 0.5}
    100%{opacity: 0.7}
  }
  @keyframes spin{
    0%{
      transform: rotate(0deg);
      .logo-img span{}
    }
    50%{
      transform: rotate(180deg);
    }
    100%{
      transform: rotate(360deg);
    }
  }
</style>
