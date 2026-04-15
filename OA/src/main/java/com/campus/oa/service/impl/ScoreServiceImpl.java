package com.campus.oa.service.impl;

import com.campus.oa.entity.Score;
import com.campus.oa.mapper.ScoreMapper;
import com.campus.oa.service.ScoreService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class ScoreServiceImpl extends ServiceImpl<ScoreMapper, Score> implements ScoreService {
}
