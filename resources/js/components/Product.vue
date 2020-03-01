<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">Add Product</div>

                    <div class="card-body">
                        <div class="form-group">
                            <label>Select Supplier:</label>
                            <select class='form-control' v-model='company' @change='getCompany()'>
                              <option value='0' >Select Supplier</option>
                              <option v-for="(company, i) in companies" :value=company.id :key=i>{{ company.name }}</option>
                            </select>
                            <!-- <p>{{ company }}</p> -->
                            <hr>
                            <input class='form-control' v-model="product" placeholder="Enter Product Name">
                            <br>
                             <input class='form-control' v-model="description" placeholder="Enter Product Description">
                             <br>
                             <input class='form-control' v-model.number="quantity" type="number" maxlength="3" min="1" max="100" placeholder="Enter The Quantity">


                        </div>


                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        mounted() {
            console.log('Component mounted.')
        },
        data(){
            return {
                company: 0,
                companies: [],
                product: "",
                description: "",
                quantity: 0,
            }
        },
        methods:{
            getCompany: function(){
              axios.get('/api/supplier/all')
              .then(function (response) {
                 this.companies = response.data;
              }.bind(this));

            },
            // getStates: function() {
            //     axios.get('/api/getStates',{
            //      params: {
            //        country_id: this.country
            //      }
            //   }).then(function(response){
            //         this.states = response.data;
            //     }.bind(this));
            // }
        },
        created: function(){
            this.getCompany()
        }
    }
</script>
