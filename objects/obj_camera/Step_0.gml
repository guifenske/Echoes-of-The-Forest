/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if !instance_exists(target) exit;

if(global.shake){
     intensity_x = 0.5;
     intensity_y = 5;

    x = lerp(x, target.x, 0.1);
    y = lerp(y, target.y - height / 7, 0.1);


     shake_x = random_range(-intensity_x, intensity_x);
     shake_y = random_range(-intensity_y, intensity_y);
    x += shake_x;
    y += shake_y;

  
    camera_set_view_pos(view_camera[0], x - width / 2, y - height / 2);
}
	else{
x = lerp(x, target.x, 0.1);
y = lerp(y, target.y - height / 7, 0.1);

camera_set_view_pos(view_camera[0], x - width / 2, y - height / 2);
}