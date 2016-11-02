<h2>Apartment Edit</h2>
<form action: "/apartments/<%= @apt.ed %>" method: post>
<input type="hidden" name="_method" value="put">

<label for="apartment[address]">Name:</label>
<input name="apartment[address]" value="<%= @apartment.name %>">

<input type="submit" value="Update">
</form>
