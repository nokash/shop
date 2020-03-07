<template lang='pug'>
<div>
<form action="" @submit="createOrder(order)">
    <label>Order ID:</label>
    <input class='form-control' v-model="order.order_id" placeholder="Enter Order ID" disabled="disabled">
    <br>
    <label>Enter Order Number:</label>
    <input class='form-control' v-model="order.order_number" placeholder="Enter Order Number">

    <label class="typo__label">Select The Product To Order:</label>
    <multiselect v-model="order.value" :options="options" :multiple="true" :close-on-select="false" :clear-on-select="false" :preserve-search="true" placeholder="Pick products" label="name" track-by="name" :preselect-first="true">
        <template slot="selection" slot-scope="{ values, search, isOpen }"><span class="multiselect__single" v-if="values.length &amp;&amp; !isOpen">{{ values.length }} options selected</span></template>
    </multiselect>

    <hr>
    <div class="card mt-4">
        <div class="card-header"><p><strong>PRODUCTS</strong></p></div>
        <div class="card-body">
        <p v-for="(v, i) in order.value" :value=v.id :key=i> {{ v.id }}. {{ v.name }} <br></p>
        </div>
    </div>
    <hr>
    <button @click.prevent="createOrder(order)"  class="btn btn-success">
    {{ isCreatingPost ? "Posting..." : "Make An Order" }}
    </button>
</form>
</div>
</template>
<script>
import { mapState } from 'vuex';


export default {

    computed: {
        ...mapState(['products'])
    },
    data () {
    return {
      options: [],
      order: {
          order_number: '',
          order_id: 0,
          value: [],
      },
      last: [],
      isLoading: false,
      status: "",
      status_msg: "",
      isCreatingPost: false,
    }
  },

  beforeMount() {
        //this.$store.dispatch('getProduct');
  },

  mounted(){
      this.getProduct();
      this.getLastOrder();


  },

  methods: {
    getProduct: function(){
              axios.get('/api/product')
              .then(function (response) {
                 this.options = response.data;
              }.bind(this));
    },

    getLastOrder: function(){
              axios.get('/api/order/last')
              .then(function (response) {
                 this.last = response.data;
                 this.order.order_id = this.last.id + 1;
              }.bind(this));
    },

    createOrder(order){

                if(!this.validateForm()){
                    return false;
                } else{
                        this.$store.dispatch('createOrder', order);

                        const that = this;
                        this.isCreatingPost = true;
                        this.order.order_number = this.order_id = "";
                        this.status = true;

                        this.shownotification("New World Order Created Successfully");
                        this.isCreatingPost = !this.isCreatingPost;
                }


            },

            validateForm(){
                if(!this.order_number){
                    this.status = false;
                    this.shownotification("Product Name cannot be empty!");
                    return false;
                }
                if(!this.product.description){
                    this.status = false;
                    this.shownotification("Product Description cannot be empty!");
                    return false;
                }
                return true;
            },
            shownotification(message){
                this.status_msg = message;
                setTimeout(() => {
                    this.status_msg = "";
                }, 3000)
            }

  }


}
</script>
<style src="vue-multiselect/dist/vue-multiselect.min.css">
