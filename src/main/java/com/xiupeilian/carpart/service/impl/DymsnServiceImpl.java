package com.xiupeilian.carpart.service.impl;

import com.xiupeilian.carpart.mapper.DymsnMapper;
import com.xiupeilian.carpart.mapper.NoticeMapper;
import com.xiupeilian.carpart.model.Dymsn;
import com.xiupeilian.carpart.model.Notice;
import com.xiupeilian.carpart.service.DymsnService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Description:
 * @Author: Tu Xu
 * @CreateDate: 2019/8/21 16:00
 * @Version: 1.0
 **/
@Service
public class DymsnServiceImpl implements DymsnService {
    @Autowired
    private DymsnMapper dymsnMapper;
    @Autowired
    private NoticeMapper noticeMapper;
    @Override
    public List<Dymsn> findDymsns() {
        return dymsnMapper.findDymsns();
    }

    @Override
    public List<Notice> findNotice() {
        return noticeMapper.findNotice();
    }
}
