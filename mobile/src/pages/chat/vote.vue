<template>
  <div>
    <div class="navbar">
      <div class="navbar-inner">
        <div class="left">
          <a href="#" class="link icon-only close-popup"><i class="icon icon-back"></i></a>
        </div>
        <div class="center">投票</div>
        <div class="right">
          <a href="#"  class="link open-popup" data-popup='.popup-form' style="font-size: 16px">发布投票</a>
        </div>
      </div>
    </div>
    <div class="content-block inset">
      <template v-if="true">
        <div class="card" v-for='x in 3'>
          <!-- <div class="card-header">
          </div> -->
          <div class="card-content">
            <div class="card-content-inner">
              <div class="row">
                <div class="col-20">
                  <div class="user-logo" style="background-image: url('12.png')"></div>
                </div>
                <div class="col-80">
                  <div class="user-name">
                    <strong class="color-indigo">用户名</strong>
                  </div>
                  <div class="vote-time small color-gray">
                    2015-6-15 15:30:75
                  </div>
                </div>
              </div>
              <span class="vote-label-status bg-orange color-white">
                进行中
              </span>
            </div>
          </div>
          <div class="card-footer">
            <div class="card-content-inner">
              <div class="row">
                <div class="vote-title color-gray">
                  投票標題
                </div>
              </div>
              <div class="row">
                <f7-list form v-if='x%2==0'>
                  <f7-list-item checkbox name="my-checkbox" value="1" title="Checkbox 1" checked></f7-list-item>
                  <f7-list-item checkbox name="my-checkbox" value="2" title="Checkbox 1"></f7-list-item>
                  <f7-list-item checkbox name="my-checkbox" value="3" title="Checkbox 1"></f7-list-item>
                </f7-list>
                <f7-list form v-else>
                  <f7-list-item radio name="my-radio" value="1" title="Radio 1" checked></f7-list-item>
                  <f7-list-item radio name="my-radio" value="2" title="Radio 2"></f7-list-item>
                  <f7-list-item radio name="my-radio" value="3" title="Radio 3"></f7-list-item>
                </f7-list>
              </div>
              <div class="row">
                <div class="col-auto end-time small color-gray text-right">
                  截至日期：2017-12-1　15:50
                </div>
              </div>
            </div>
          </div>
        </div>
      </template>

      <template v-else>
        <div class="content-block-inner text-center">
          <i class="fa fa-bar-chart-o fa-5x color-gray"></i>
          <p>暂无投票，点击发布投票！</p>
        </div>
        <p class="buttons-row">
          <a href="#" class="button button-big button-fill button-raised color-teal open-popup" data-popup='.popup-form'>发布投票</a>
        </p>
      </template>

    </div>
    <div class="popup popup-form">
      <vote-form></vote-form>
    </div>
  </div>
</template>

<script>
import VoteForm from './vote_form'
export default {
  components: { VoteForm },
  data: function () {
    return {}
  }
}
</script>

<style lang="sass" scoped>
  .content-block
    padding: 0px
  .card
    .row
      width: 100%
      .user-logo
        width: 50px
        height: 50px
        border-radius: 50%
        border: 1px solid #e4e4e4
        margin: 0 auto
      .user-name
      .vote-time
        font-size: 80%
        line-height: 2.5em
    .vote-label-status
      padding: 2px 5px
      position: absolute
      right: 0px
      top: 0px
      box-shadow: 0px 1px 5px 0px #ff9800
    .card-footer
      .card-content-inner
        width: 100%
        form
          width: 100%
        .end-time
          font-size: 0.8em
</style>
