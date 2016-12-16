<template>
  <div class="loading">
    <div class="center-animation">
      <div class="circle-parent">
        <div class="line"></div>
        <div class="circle circle-left"></div>
        <div class="circle circle-right"></div>
      </div>
      <div class="logo-img">
        <img :src="imageUrl" >
      </div>
    </div>
    <span class="message">{{message}}</span>
  </div>
</template>

<script>
  export default({
    props: {
      imageUrl: { type: String, default: 'http://cn.vuejs.org/images/logo.png' },
      message: { type: String, default: '...LOAdING...' }
    }
  })
</script>

<style scoped>
  .loading{
    background: rgba(0, 0, 0, 0.7);
    width: 100%;
    height: 100%;
    position: fixed;
    top: 0px;
    right: 0px;
    z-index: 9999;
    padding: 0px;
  }
  .center-animation{
    color: #fff;
    width: 10%;
    height: 10vw; /* equal to width */
    margin-top: -9vw; /* -(width/2 + padding) */
    margin-left: -9vw; /* -(width/2 + padding) */
    top: 50vh;
    left: 50vw;
    position: relative;
    padding: 4vw;
  }
  .logo-img{
    width: 100%;
    height: 100%;
    border-radius: 50%;
    overflow: hidden;
    background: #ccc;
  }
  span.message {
    position: absolute;
    left: 0px;
    top: 50vh;
    margin-top: 10vw;
    width: 100%;
    padding-top: 1em;
    color: #FFF;
    display: inline-block;
    text-align: center;
    animation: opacity 2s infinite linear;
  }
  .logo-img img{
    object-fit: cover;
    width: 70%;
    height: 70%;
    margin-left: 15%;
    margin-top: 15%;
  }
  .circle-parent{
    position: absolute;
    width: 100%;
    height: 100%;
    left: 0px;
    top: 0px;
    animation: spin 12s infinite linear;
  }
  .circle-parent .line{
    width: 100%;
    height: 100%;
    border: 4px dashed #fff;
    position: absolute;
    top: -4px;
    left: -4px;
    border-radius: 50%;
    animation: spin 10s infinite linear;
    opacity: 0.3
  }
  .circle{
    border-radius: 50%;
    height: 20%;
    width: 20%;
    position: absolute;
    opacity: 0.8;
    /*box-shadow:0 0 30px 5px rgba(255,255,255,.1) inset;*/
  }
  .circle-left{
    background: #ffaf06;
    left: -10%;
    bottom: 40%;
  }
  .circle-right{
    background: #008dff;
    right: -10%;
    bottom: 40%;
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
    }
    50%{
      transform: rotate(180deg);
    }
    100%{
      transform: rotate(360deg);
    }
  }
</style>
