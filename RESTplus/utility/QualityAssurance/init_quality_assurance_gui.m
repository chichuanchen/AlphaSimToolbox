function handles=init_quality_assurance_gui()
%-----------------------------------------------------------
%   Copyright(c) 2015
%	Center for Cognition and Brain Disorders, Hangzhou Normal University, Hangzhou 310015, China
%	Written by JIA Xi-Ze 20150726
%	http://www.restfmri.net/
% 	Mail to Authors: jxz.rest@gmail.com, jiaxize@foxmail.com
%	Version=1.0;

figure_property.figure_name='Quality Assurance';
handles=init_figure_600x330(figure_property);
handles=init_UserP_600x330(handles);
handles=init_radiobutton_ui(handles);
init_h_radiobtn_ui_callback(handles);

end

function handles=init_radiobutton_ui(handles)
ui_property_cell={{'h_name','h_program_title_text',...
                    'style','text',...
                    'position',[130 275 ...
                                handles.UserP.line1.y 30],...
                    'fontsize',20,...
                    'string','Quality assurance'},...
                   {'h_name','h_image_snr_radiobutton',...
                   'style','radiobutton',...
                   'position_xy',[25 handles.UserP.line4.y],...
                   'string','image SNR',...
                   'tag','tag_image_snr_radiobutton',...
                   },...
                   {'h_name','h_temporal_snr_radiobutton',...
                   'style','radiobutton',...
                   'position_xy',[135 handles.UserP.line4.y],...
                   'string','temporal SNR',...
                   'tag','tag_temporal_snr_radiobutton'},...
                   {'h_name','h_detrend_value_radiobutton',...
                   'style','radiobutton',...
                   'position_xy',[450 handles.UserP.line4.y],...
                   'string','detrend value',...
                   'tag','tag_detrend_value_radiobutton',...
                   'visible','off'},...
                  };
              
handles.h_radiobtn_ui_struct=draw_uicontrol_cell_h2x(handles.h_fig,ui_property_cell);
% {'h_name','h_slice_homogeneity_radiobutton',...
%                    'style','radiobutton',...
%                    'position_xy',[275 handles.UserP.line4.y],...
%                    'string','slice homogeneity',...
%                    'tag','tag_slice_homogeneity_radiobutton'},...
              
end


function init_h_radiobtn_ui_callback(handles)
h_radiobutton_list=init_radiobutton_list(handles.h_radiobtn_ui_struct);                

for i=1:length(h_radiobutton_list)
    set(h_radiobutton_list(i),...
       'callback',{@the_radiobtn_ui_callback,h_radiobutton_list}); 
end
end



function the_radiobtn_ui_callback(hObject, eventdata,h_radiobutton_list)
handles=guidata(hObject);

tag_current=get(hObject,'tag');                
                
if strcmp(get(hObject,'style'),'radiobutton')                
   RadioBtnSet(h_radiobutton_list,hObject);
   close(handles.h_fig);
   
   if strcmp(tag_current,'tag_image_snr_radiobutton')
          image_snr_gui();
   elseif strcmp(tag_current,'tag_temporal_snr_radiobutton')
          temporal_snr_gui();
   elseif strcmp(tag_current,'tag_slice_homogeneity_radiobutton')
          slice_homogeneity_gui();
   elseif strcmp(tag_current,'tag_detrend_value_radiobutton')
       
   else    
       error('the_radiobtn_ui_callback');
   end
   
   
end
end






