<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">Add Supplier</div>

                    <div class="card-body">
                        <div class="form-group">
                            <hr>
                            <input class='form-control' v-model="supplier" placeholder="Enter Company Name">
                            <br>

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
                company: "",
                
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
