function save_all_figures_to_directory(dir_name,extra)
figlist=findobj('type','figure');
names=get(figlist,'Name')
names= strrep(names,' ', '_')
for i=1:numel(figlist)
    stuff=strcat(strcat(char(names(i)),extra))
    filename=fullfile(dir_name,strcat(strcat(char(names(i)),extra),'.png'))
    saveas(figlist(i),filename);
end
end