---
title: ISAT
date: 2023-09-05 10:28:23
tags:
---


```bash
conda create -n ISAT python=3.10 -y
conda install pytorch torchvision torchaudio pytorch-cuda=11.8 -c pytorch -c nvidia
pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
pip install -r requirements.txt
conda install -c conda-forge pycocotools
```

# 参考资料
[ISAT_with_segment_anything](https://github.com/yatengLG/ISAT_with_segment_anything)

