from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

from .datasets.coco import COCO
from .datasets.coco_hp import COCOHP
from .datasets.crowdhuman import CrowdHuman
from .datasets.custom_dataset import CustomDataset
from .datasets.kitti import KITTI
from .datasets.kitti_tracking import KITTITracking
from .datasets.mot import MOT
from .datasets.nuscenes import nuScenes

dataset_factory = {
    "custom": CustomDataset,
    "coco": COCO,
    "kitti": KITTI,
    "coco_hp": COCOHP,
    "mot": MOT,
    "nuscenes": nuScenes,
    "crowdhuman": CrowdHuman,
    "kitti_tracking": KITTITracking,
}


def get_dataset(dataset):
    return dataset_factory[dataset]
