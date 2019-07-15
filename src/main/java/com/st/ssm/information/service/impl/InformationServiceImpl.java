package com.st.ssm.information.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.ssm.information.mapper.InformationMapper;
import com.st.ssm.information.model.InformationModel;
import com.st.ssm.information.service.IInformationService;
import com.st.ssm.util.FmtEmpty;
@Service
public class InformationServiceImpl implements IInformationService{
	@Autowired
	private InformationMapper informationMapper;
	
	@Override
	public List<InformationModel> selectModel(InformationModel model) {
		List<InformationModel> list = informationMapper.selectModel(model);
		return list;
	}
	@Override
	public Object selectCount(InformationModel model) {
		return informationMapper.selectCount(model);
	}
	@Override
	public int insertByCode(InformationModel model) {
		if(selectList(model) == null) {
			return FmtEmpty.isEmpty(insert(model)) ? 2 : 0;
		}
		return 1;
	}
	public InformationModel selectList(InformationModel model) {
		InformationModel im = new InformationModel();
		im.setCode(model.getCode());
		List<InformationModel> list = selectModel(im);
		return FmtEmpty.isEmpty(list) ? null : list.get(0);
	}
	private int insert(InformationModel model) {
		return informationMapper.insert(model);
	}
	@Override
	public int delete(InformationModel model) {
		if(informationMapper.delete(model) == 1) {
			return 1;
		}
		return 0;
	}
	@Override
	public int update(InformationModel model) {
		if(informationMapper.update(model) == 1) {
			return 1;
		}
		return 0;
	}
	

	

}
