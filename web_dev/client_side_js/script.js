// Release 1
var ulTag = document.getElementsByTagName('ul');
var newLi = document.createElement('li');
newLi.appendChild(document.createTextNode("its black and white"));
ulTag[0].appendChild(newLi);

//loop through ulTag.children (array)
function purpleText(event) {
	var childrenTags = event.target.children;
	console.log(childrenTags);
	for (var i = 0; i < childrenTags.length; i++) {
		childrenTags[i].style.color = "purple";
	}
}

//Release 2
function pinkBorder(event) {
	event.target.style.border = "2px pink solid";
}

var photo = document.getElementById('lizard-photo');
photo.addEventListener('click', pinkBorder);

ulTag[0].addEventListener('mouseover', purpleText);
