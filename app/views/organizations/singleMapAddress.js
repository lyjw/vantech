$.ajax({
  method: "GET",
  url: baseUrl + "organizations/home/<%= @organization.id %>.json",
  success: function(organization){
    // for(var i = 0, len = organizations.length; i < len; i++) {
    //   // console.log(organizations[i].address);
    //   addressArray.push(organizations[i].address);
    // }
    addressArray.push(organization.address);
    console.log(addressArray);
  },
  error:  function(){
    console.log("Error loading addresses. Please try again");
  }
});
