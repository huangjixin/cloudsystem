package com.codingapi.tx.springcloud.service.impl;

import com.codingapi.ribbon.loadbalancer.TxManagerProperity;
import com.codingapi.tx.config.service.TxManagerTxUrlService;

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