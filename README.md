this shell Script can use for the Batching of deepflow or fastdeepflow, when you want to build Flow Images without Python wrapper.



#### 1. Build the file name list in Text
```
bash create_file_list.sh
```
The first step create a file list for your dataset.
Extract all of the absolute address of images and print in a Text file, of course build a Text for every video is better. 

#### 2. Run shell
Just put the `batch_deepflow.sh` in the root file of deepflow or fastdeepflow, and run `bash batch_deepflow.sh` in Terminal.

It push every two frames from a video after `./deepflow2` or `./fastdeepflow` programm until the last frame. The file name of flow images follow the first image of every two frames.

