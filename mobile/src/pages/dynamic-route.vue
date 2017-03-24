<template>
  <f7-page>
    <f7-navbar title="Dynamic Route" back-link="Back" sliding></f7-navbar>
    <f7-block inner>
      <ul>
        <li><b>Url:</b> </li>
        <li><b>Path:</b> </li>
        <li><b>Hash:</b> </li>
        <li><b>Params:</b>
          <ul>
            <li v-for="(value, key) in $route.params"><b>:</b> </li>
          </ul>
        </li>
        <li><b>Query:</b>
          <ul>
            <li v-for="(value, key) in $route.query"><b>:</b> </li>
          </ul>
        </li>
        <li><b>Route:</b> </li>
      </ul>
    </f7-block>
    <f7-block inner>
      <f7-link @click="$route.view.router.back()">Go back via Router API</f7-link>
    </f7-block>

  </f7-page>
</template>

<script>
export default {}
</script>
