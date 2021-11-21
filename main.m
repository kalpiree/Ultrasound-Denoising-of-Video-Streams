src_video = 'sample_1.mp4';
intermediate_folder = 'src_imgs/';
tgt_video = 'filter_video';
disp('Breaking video into frames...')
breakVideo(src_video, intermediate_folder)

file_list = dir(intermediate_folder);
no_of_files = size(file_list,1) - 2;
mkdir('filter_a_imgs/')
mkdir('filter_b_imgs/')
mkdir('filter_c_imgs/')

for ii=0:no_of_files-1 
    disp(strcat(int2str(ii),'/',int2str(no_of_files),' frames done. Applying filters'))
    I = imread(strcat(intermediate_folder,int2str(ii),'.bmp')); 
    I_filter_a = fourier_speckle(I);
    I_filter_b = median_speckle(I);
    I_filter_c = mean_speckle(I);
    imwrite(mat2gray(I_filter_a), strcat('filter_a_imgs/',int2str(ii),'.bmp'))
    imwrite(mat2gray(I_filter_b), strcat('filter_b_imgs/',int2str(ii),'.bmp'))
    imwrite(mat2gray(I_filter_c), strcat('filter_c_imgs/',int2str(ii),'.bmp'))
end

a_snr_a = 0;
for ii=0:no_of_files-1 
    disp(strcat(int2str(ii),'/',int2str(no_of_files), ' frames done. Calculating PSNR for Fourier filter.'))
    I1 = imread(strcat(intermediate_folder,int2str(ii),'.bmp'));
    I2 = imread(strcat('filter_a_imgs/',int2str(ii),'.bmp'));
    snr_a = PSNR(I1,I2);
    a_snr_a = a_snr_a + snr_a;
end

a_snr_a = a_snr_a/(no_of_files);

a_snr_b = 0;
for ii=0:no_of_files-1 
    disp(strcat(int2str(ii),'/',int2str(no_of_files), '  frames done. Calculating PSNR for Median filter.'))
    I1 = imread(strcat(intermediate_folder,int2str(ii),'.bmp'));
    I2 = imread(strcat('filter_b_imgs/',int2str(ii),'.bmp'));
    snr_b = PSNR(I1,I2);
    a_snr_b = a_snr_b + snr_b;
end

a_snr_b = a_snr_b/(no_of_files);

a_snr_c = 0;
for ii=0:no_of_files-1 
    disp(strcat(int2str(ii),'/',int2str(no_of_files), '  frames done. Calculating PSNR for Mean filter.'))
    I1 = imread(strcat(intermediate_folder,int2str(ii),'.bmp'));
    I2 = imread(strcat('filter_c_imgs/',int2str(ii),'.bmp'));
    snr_c = PSNR(I1,I2);
    a_snr_c = a_snr_c + snr_c;
end

a_snr_c = a_snr_c/(no_of_files);

tgt_dir = '';

if a_snr_a > a_snr_b
    if a_snr_a > a_snr_c
        tgt_dir = 'filter_a_imgs/';
        disp('Best Average PSNR obtained for Fourier filter.')
        
    else
        tgt_dir = 'filter_c_imgs/';
        disp('Best Average PSNR obtained for Mean filter.')
    end
else
    if a_snr_b > a_snr_c
        tgt_dir = 'filter_b_imgs/';
        disp('Best Average PSNR obtained for Median filter.')
    else
        tgt_dir = 'filter_c_imgs/';
        disp('Best Average PSNR obtained for Mean filter.')
    end
end

disp('Generating filtered video...')
joinImage(tgt_dir, tgt_video)

vid = VideoReader(strcat(tgt_video,'.avi'));
framesarray = read(vid);

recursivetempframes = recursive_temp(framesarray);

vid = VideoWriter(tgt_video);
open(vid);
writeVideo(vid,recursivetempframes);
close(vid);
disp('Filtered video generated.')
rmdir('filter_a_imgs/','s')
rmdir('filter_b_imgs/','s')
rmdir('filter_c_imgs/','s')
rmdir('src_imgs/','s')