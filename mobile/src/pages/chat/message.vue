<template>
  <div data-page="message" class="page navbar-through toolbar-through">
    <div class="navbar">
      <div class="navbar-inner">
        <div class="left sliding">
          <a href="#" class="link icon-only" @click="onShowLeftPanel"><i class="fa fa-bars"></i></a>
        </div>
        <div class="center">
          {{ selcetChannel.id ? '频道-'+selcetChannel.name : '' }}
        </div>
        <div class="right sliding"><a href="/about/"  class=" link icon-only"><i class="fa fa-user"></i></a>
        </div>
      </div>
      <!-- 选择侧边栏 -->
      <div class="sidebar-left" v-show="showLeftPanel">
        <div class="mask" @click="onShowLeftPanel"></div>
        <div class="modal-in">
          <div class="content-block">
            <h5>频道选择</h5>
            <div class="list-block">
              <ul>
                <li v-for="channe in channelList" :class=" channe.id == selcetChannel.id ? 'active' : false">
                  <a href="#" class="my-link ripple" @click="onChangeChannel(channe)">
                    <i class="fa fa-circle" :class="channe.id == selcetChannel.id ? 'active':''"></i>
                    频道-{{ channe.name }}
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="page-content pull-to-refresh-content" style="background: #f3f3f3;">
      <div class="pull-to-refresh-layer">
        <div class="preloader"></div>
        <div class="pull-to-refresh-arrow"></div>
      </div>
      <!-- message list -->
      <div class="messages messages-auto-layout">
        <template v-for="message in messages">
          <div class="messages-date" style="white-space: pre;" v-if="message.type === 'system'">
            {{ message.text }}
          </div>

          <div v-if="message.type === 'send' || message.user_id === currentUser.id" class="message message-sent message-with-avatar message-first message-last message-with-tail" style="white-space: pre;">
            <div class="message-name">{{ message.name }}</div>
            <div class="message-text">
              <span v-text="message.text"></span>
              <div class="message-date" v-if="calculationDate(message.date) || false" >{{ formatDate(message.date) }}</div>
            </div>
            <div class="message-avatar" :style="'background-image: url('+message.avatar+')'"></div>
            <div class="message-label">{{ message.label }}</div>
            <template v-if="message.name===currentUser.name">
              <i class="fa fa-warning message-mark warning" v-if="message.status==='error'" @click="onReSeed(message)"></i>
              <i class="fa fa-circle-o-notch rotate message-mark" v-if="message.status==='waitingToSend'"></i>
            </template>
          </div>

          <div v-if="message.type === 'message' && message.user_id !== currentUser.id" class="message message-received message-with-avatar message-first message-last message-with-tail" style="white-space: pre;">
            <div class="message-name">{{ message.name }}</div>
            <div class="message-text">
              <span v-text="message.text"></span>
              <div class="message-date" v-if="calculationDate(message.date)" >{{ formatDate(message.date) }}</div>
            </div>
            <div class="message-avatar" :style="'background-image: url('+message.avatar+')'"></div>
            <div class="message-label">{{ message.label }}</div>
          </div>
        </template>

      </div>
      <!-- <f7-messages>
         <f7-message v-for="message in messages"
          :text="message.text"
          :label="message.label"
          :date="message.date"
          :name="message.name"
          :avatar="message.avatar"
          :type="message.type"
          :day="message.day"
          :time="message.time"
           @click="onClick"
           @click:text="onTextClick"
           @click:name="onNameClick"
           @click:avatar="onAvatarClick"
           :autoLayout="false"
           style="white-space: pre"
         >
        </f7-message>
      </f7-messages> -->
    </div>

    <div class="toolbar messagebar" :class="showToolbarMore ? 'show-operation-panel': false">
      <div class="toolbar-inner">
        <a href="#" class="link"　@click="onOpenMoerControl">
          <i class="fa fa-plus left-more"></i>
        </a>
        <textarea placeholder="Message" v-model="textareaText" @click="onFocusInput()"></textarea>
        <a href="#" @click="onSubmit" class="link"  :class="(textareaText.length <1 ? 'gray':'') ">
          <i class="fa fa-paper-plane-o right-send"></i>
        </a>
      </div>
      <div class="toolbar-operation-panel" v-show="showToolbarMore">
        <div class="row" style="margin: 12px auto">
          <div class="col-33">
            <div class="center">
              <a href="#" class="top">
                <i class="fa fa-2x fa-image"></i>
                <input id="fileId1" type="file" accept="image/png,image/gif" name="file" class="selcet-image"/>
              </a>
              <div class="small">发送图片</div>
            </div>
          </div>
          <div class="col-33">
            <div class="center">
              <a href="#" class="top open-popup" data-popup=".popup-vote" >
                <i class="fa fa-2x fa-bar-chart"></i>
              </a>
              <div class="small">发起投票</div>
            </div>
          </div>
          <div class="col-33">
            <div class="center">
              <a href="#" class="top">
                <i class="fa fa-2x fa-share-alt"></i>
              </a>
              <div class="small">分享产品</div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="popup popup-vote">
      <vote></vote>
    </div>
  </div>
</template>
<script>
  require('assets/js/chat/action_cable.js')
  require('assets/js/chat/room.coffee')
  import RoomService from 'services/chat/room'
  import MessageService from 'services/chat/message'
  import { GET_USER } from 'store/modules/common'
  import Vote from './vote'
  export default {
    components: { Vote },
    data: function () {
      return {
        meta: {
          current_page: 1,
          total_pages: 0,
          total_count: 0
        },
        pageSize: 50,
        channelList: [],
        selcetChannel: {
          id: '',
          name: ''
        },
        showToolbarMore: false,
        showLeftPanel: false,
        nowTime: new Date().getTime(),
        currentUser: {
          id: 1,
          name: 'Vladimir',
          avatar: require('assets/img/icon.png')
        },
        textareaText: '',
        loadMessage: false,
        messages: []
      }
    },
    watch: {
      loadMessage (val) {
        if (val) {
          window.f7.showIndicator()
        } else {
          window.f7.hideIndicator()
        }
      }
    },
    methods: {
      getChannelList () {
        let self = this
        RoomService.all().then(function (response) {
          self.channelList = response.data.data
          self.loadMessage = false
        })
      },
      getChannelMessage () {
        let self = this
        let options = {
          current_page: this.meta.current_page,
          pageSize: this.pageSize,
          room_id: this.selcetChannel.id
        }
        MessageService.all(options).then(function (response) {
          let data = response.data
          for (let record of data.data) {
            self.messages.unshift({
              id: record.id,
              text: record.text,
              user_id: record.user.id,
              name: record.user.nickname,
              avatar: record.user.headshot,
              type: 'message',
              date: record.created_at * 1000
            })
          }
          self.meta = data.meta
          self.loadMessage = false
          window.f7.pullToRefreshDone('.pull-to-refresh-content')
        }).catch(function () {
          window.f7.alert('加载失败!', '提示')
          window.f7.pullToRefreshDone('.pull-to-refresh-content')
        })
      },
      onClick: function (event) {
        console.log('message click')
      },
      onAvatarClick: function () {
        console.log('avatar-click')
      },
      onTextClick: function () {
        console.log('text-click')
      },
      onNameClick: function () {
        console.log('name-click')
      },
      onReSeed (message) {
        // resend
        message.status = 'waitingToSend'
        if (this.send(message)) {
          message.status = 'ok'
        } else {
          message.status = 'error'
        }
      },
      send (messageObj) {
        if (window.RoomChannel.current) {
          return window.RoomChannel.current.say(messageObj.text)
        } else {
          window.f7.alert('请先选择一个频道', '提示')
          return false
        }
      },
      onSubmit () {
        if (!window.RoomChannel.current) {
          window.f7.alert('请先选择一个频道', '提示')
          return
        }
        if (this.textareaText.trim().length === 0) return
        let mess = {
          user_id: this.currentUser.id,
          name: this.currentUser.name,
          avatar: this.currentUser.avatar,
          text: this.textareaText,
          status: 'waitingToSend',
          type: 'send',
          date: new Date().getTime()
        }
        this.messages.push(mess)
        // send
        if (this.send(mess)) {
          mess.status = 'ok'
        } else {
          mess.status = 'error'
        }
        // Clear Message
        this.textareaText = ''
        this.scrollToBottom()
      },
      scrollToBottom () {
        let dom = this.$$('.messages.messages-auto-layout').parent()
        dom.scrollTop(dom.outerHeight())
      },
      onOpenMoerControl () {
        if (this.showToolbarMore) {
          this.showToolbarMore = false
        } else {
          this.showToolbarMore = true
        }
      },
      onFocusInput () {
        this.showToolbarMore = false
        this.scrollToBottom()
      },
      onShowLeftPanel () {
        this.$$('.sidebar-left .modal-in').scrollTop(0)
        if (this.showLeftPanel) {
          this.$$('.sidebar-left .modal-in').transform('translate(-100%, 0px)')
          this.showLeftPanel = false
        } else {
          this.showLeftPanel = true
          this.$$('.sidebar-left .modal-in').transform('translate(125%, 0px)')
        }
      },
      onReceived (data) {
        let mess = {}
        if (data.type === 'system') {
          mess = {
            type: data.type,
            text: data.message
          }
        } else {
          mess = {
            user_id: data.user.id || '',
            type: data.type,
            name: data.user.nickname,
            avatar: data.user.avatar || '',
            text: data.message
          }
        }
        this.messages.push(mess)
      },
      bindSubscription (subscription) {
        let _received = subscription.received
        let self = this
        subscription.received = function (data) {
          _received(data)
          self.onReceived(data)
        }
      },
      onChangeChannel (channel) {
        window.RoomChannel.leave()
        this.messages = []
        this.loadMessage = true
        this.selcetChannel = channel
        this.meta.current_page = 1
        this.getChannelMessage()
        let _channel = window.RoomChannel.switch(channel.id, channel.name)
        this.bindSubscription(_channel.subscription)
        this.textareaText = ''
        this.onShowLeftPanel()
        window.f7.pullToRefreshDone('.pull-to-refresh-content')
      },
      calculationDate (date) {
        if (this.nowTime - date > 300000) {
          return true
        }
      },
      formatDate (str) {
        let timeDate = new Date(str)
        let year = timeDate.getFullYear()
        let month = timeDate.getMonth() + 1
        let date = timeDate.getDate()
        let hour = timeDate.getHours()
        let minute = timeDate.getMinutes()
        let second = timeDate.getSeconds()
        return year + '年' + month + '月' + date + '日 ' + hour + '时' + minute + '分' + second + '秒'
      }
    },
    mounted () {
      let self = this
      this.$$('.pull-to-refresh-content').off('on').on('refresh', function (e) {
        console.log('加载历史记录')
        if (!window.RoomChannel.current) {
          window.f7.alert('请先选择一个频道', '提示')
          window.f7.pullToRefreshDone('.pull-to-refresh-content')
          return
        }
        if (self.meta.current_page < self.meta.total_pages) {
          self.meta.current_page += 1
          self.getChannelMessage()
        } else {
          window.f7.pullToRefreshDone('.pull-to-refresh-content')
          window.f7.alert('没有更多的历史记录', '提示')
        }
      })
      console.log(GET_USER)
      this.loadMessage = true
      this.getChannelList()
      window.RoomChannel.connect('user_name1')
    }
  }
</script>
<style lang="sass"　scoped>
  .gray, .gray a
    color: #ccc !important
  .messages.messages-auto-layout
    padding-bottom: 70px !important
  .navbar
    .sidebar-left
      position: fixed
      left: 0
      top: 0
      width: 100%
      height: 100%
      z-index: 13000
      .mask
        width: 100%
        height: 100%
        background: rgba(0,0,0,.4)
        z-index: 1299
      .modal-in
        transition: transform 5s
        position: absolute
        left: -100%
        top: 0 !important
        z-index: 13000
        background: url("/static/img/page_bg_bottom_light.351810246defaaf0cbd96bbe1596d9b5.png") repeat-x bottom center rgb(195, 0, 66)
        //  #5d224c
        top: 63px
        color: #f5f5f5
        width: 80%
        height: 100%
        overflow-y: scroll
        .content-block
          padding: 0px
          margin: 0px
          h5
            font-weight: bold
            border-bottom: 1px solid #5d3551
            line-height: 35px
            padding: 10px 0px
            margin: 0px 15px
          .list-block
            margin: 0px
            padding: 15px 0px
            li.active
              // background: #845576
              background-color: rgba(255,255,255,0.3)
            li
              line-height: 40px
              a
                display: inline-block
                width: 100%
                color: #f5f5f5
                font-size: 14px
                font-weight: bold
                i
                  margin: 0px 10px 0px 15px
                  font-size: 12px
                  color: #ccc
                i.active
                  color: #35a282
  .toolbar.messagebar
    background-color: #f1f1f1 !important
    .left-more
      color: #4a4a4a
  .toolbar.messagebar.show-operation-panel
    padding-bottom: 170px
    .toolbar-inner
      height: auto !important
    .toolbar-operation-panel
      color: #646464
      position: absolute
      height: 122px
      width: 100%
      bottom: 0px
      left: 0px
      background: #fafafa
      text-align: center
      .center
        margin: 0 auto
        width: 50%
        .small
          line-height: 30px
          font-size: 10px
        .top
          margin: 0 auto
          box-shadow: 0px 0px 5px -1px #bfbfbf
          border: 1px solid #c7c7c7
          border-radius: 5px
          width: 40px
          height: 40px
          padding: 5px
          background: #fff
          display: inline-block
          position: relative
          .selcet-image
            position: absolute
            top: 0px
            left: 0px
            width: 52px
            height: 52px
            opacity: 0
          i
            color: #49585f
            line-height: 40px
  // .toolbar.messagebar
  //   // position: fixed
  //   // bottom: 0px
  //   // left: 0px
  //   max-height: 60px !important
  //   .toolbar-inner
  //     textarea
  //       height: 30px !important
  //     a
  //       height: 100% !important
  @keyframes rotation
    from
      transform: rotate(0deg)
    to
      transform: rotate(360deg)
  .rotate
    animation: rotation 1s linear infinite
  .message-sent
    position: relative
    .message-mark
      left: -25px
      position: absolute
      color: #ccc
      top: 20px
    .message-mark.warning
      color: red
</style>
