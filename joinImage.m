function joinImage(src_dir, tgt_vid)
    file_list = dir(src_dir);
    no_of_files = size(file_list,1) - 2;
    
    video = VideoWriter(tgt_vid); %create the video object
    open(video); %open the file for writing
    for ii=0:no_of_files-1 %where N is the number of images
      I = imread(strcat(src_dir,int2str(ii),'.bmp')); %read the next image
      writeVideo(video,I);%write the image to file
    end
    close(video); %close the file
end
