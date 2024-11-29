/// @description Draw textbot in screen

// Draw textbox
draw_self();

// Draw text with the indicated font settings, color and in the indicated positions.
draw_set_font(fnt_textbox);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_ext_color(x, y, text_to_show, line_height, text_width, c_black, c_black, c_black, c_black, image_alpha)