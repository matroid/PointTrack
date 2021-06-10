About PointTrack
================

README by: Tak @ Matroid

In order to produce the most advanced system for compiling video summary, there are 3 steps that must be taken:

* Find/develop models that can perform object detection and online tracking for pedestrian
* Find/develop models that can perform instance segmentation and online tracking for both vehicle and pedestrian
* Evolve the model to be more efficient and re-trainable with more classes

### Object Detection and Tracking

The Multi Object Tracking Benchmark (MOT challenge) series acts as a perfect evaluator for this task. The challenge completely focus on pedestrian tracking based on bounding boxes, with submissions evaluated using MOTA scores. According to [MOT17](https://motchallenge.net/results/MOT17/?det=All) and [MOT20](https://motchallenge.net/results/MOT20/?det=All), at that point of evaluation, there are 2 papers that caught my attention. They are not at the top of the board, but many of the leading entries are proprietary models or models without code/weights.

* [DEFT: Detection Embeddings for Tracking](https://arxiv.org/abs/2102.02267)
* [FairMOT: On the Fairness of Detection and Re-Identification in Multiple Object Tracking](https://arxiv.org/abs/2004.01888)

It was then decided that, given FairMOT has better MOTA as well as FPS numbers, it shall be selected as the v1 backbone for Matroid object tracking. With the first step complete, the second stage can begin.

### Instance Segmentation and Tracking

At this point of writing, the most recent challenge/benchmark is no other than the RobMOTS challenge that will be hosted at CVPR 2021. They focus on 8 distinctive datasets/challenges to jointly evaluate the performance of trackers:

* [MOTS Challenge](https://motchallenge.net/results/MOTS/)
* [KITTI MOTS](http://www.cvlibs.net/datasets/kitti/eval_mots.php)
* [DAVIS Challenge Unsupervised](https://davischallenge.org/challenge2020/unsupervised.html)
* [YouTube-VIS](https://youtube-vos.org/dataset/vis/)
* [BDD100K MOTS](https://www.bdd100k.com/)
* [TAO](https://taodataset.org/)
* [Waymo Open Dataset](https://waymo.com/open/)
* [OVIS](http://songbai.site/ovis/)

Among the 8 datasets, the first 2 are the most interesting/relevant ones; in fact, if you read the [MOTS paper](https://arxiv.org/pdf/1902.03604.pdf), you'll see that the new datasets contain video from MOT16 and KITTI, with segmentation data added.

* Sequences: 12 + 9 + 4 = 25
* Frames: 5027 + 2981 + 2862 = 10870
* Pedestrian:
  - 99 + 68 + 228 = 395 tracks
  - 8073 + 3347 + 26894 = 38314 masks
* Car:
  - 431 + 151 + 0 = 582 tracks
  - 18831 + 8068 + 0 = 26899 masks

The [new KITTI dataset](http://www.cvlibs.net/datasets/kitti/eval_mots.php) is even more up-to-date that it includes the entirety of MOTS with extra videos from KITTI-2012. There is also a new evaluation metric [HOTA](https://arxiv.org/abs/2009.07736) that is replacing the current sMOTSA metric. This [blog post](https://jonathonluiten.medium.com/how-to-evaluate-tracking-with-the-hota-metrics-754036d183e1) summarizes it well.

Looking at the [5th BMTT MOTChallenge Workshop: Multi-Object Tracking and Segmentation](https://motchallenge.net/workshops/bmtt2020/index.html) that did happen in conjunction with CVPR 2020 based on the MOTS dataset/challenge, the best two models are:

* [ReMOTS: Refining Multi-Object Tracking and Segmentation](https://motchallenge.net/workshops/bmtt2020/papers/ReMOTS.pdf)
* [PointTrack++ for Effective Online Multi-Object Tracking and Segmentation](https://motchallenge.net/workshops/bmtt2020/papers/PointTrack++.pdf)

The first paper does not have an accompanying Github repo unfortunately. Therefore, after all of the above description and before CVPR 2021 occurs, the very best model we can find that is publicly available is this repo that's sitting in front of you. This repo shall be carefully examined to see if it can help achieve the 2nd stage of the three step plan.
