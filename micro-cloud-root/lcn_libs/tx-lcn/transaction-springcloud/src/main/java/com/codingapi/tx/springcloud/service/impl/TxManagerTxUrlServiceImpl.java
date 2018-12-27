package com.codingapi.tx.springcloud.service.impl;

import com.codingapi.ribbon.loadbalancer.TxManagerProperity;
import com.codingapi.tx.config.service.TxManagerTxUrlService;

/**
 * create by lorne on 2017/11/18
 */
public class TxManagerTxUrlServiceImpl implements TxManagerTxUrlService {


    private TxManagerProperity property;

    public TxManagerTxUrlServiceImpl(TxManagerProperity property) {
        this.property = property;
    }

    @Override
    public String getTxUrl() {
        return property.getUrl();
    }
}
