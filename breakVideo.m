function breakVideo(src_video,tgt_dir)
    vid = VideoReader(src_video);
    numberOfFrames = vid.NumFrames;
    
    mkdir(tgt_dir)
    cnt = 0;
    while hasFrame(vid)
        frame = readFrame(vid);
        frame = im2gray(frame);
        imwrite(frame, strcat(tgt_dir,int2str(cnt),'.bmp'))
        cnt = cnt + 1;
    end
end