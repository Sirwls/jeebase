package com.doubleview.jeebase.system.controller;

import com.doubleview.jeebase.support.base.BaseController;
import com.doubleview.jeebase.support.web.ResponseResult;
import com.doubleview.jeebase.support.web.TreeDataResult;
import com.doubleview.jeebase.system.model.Area;
import com.doubleview.jeebase.system.service.AreaService;
import com.doubleview.jeebase.system.utils.SystemCacheUtils;
import com.google.common.collect.Lists;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 地区控制器
 */
@RequestMapping("${adminPath}/system/area")
@Controller
public class AreaController extends BaseController{



    @Autowired
    private AreaService areaService;

    /**
     * @return
     */
    @RequestMapping("")
    public String toAreaPage() {
        return "system/area";
    }


    /**
     * 根据id获取Area
     *
     * @param id
     * @return
     */
    @RequestMapping("get")
    @ResponseBody
    public ResponseResult<Area> getArea(String id) {
        if (StringUtils.isBlank(id)) {
            throw new RuntimeException("id is null");
        }
        Area area = areaService.get(id);
        return success(area);
    }


    /**
     * 返回菜单树形数据
     *
     * @return
     */
    @RequestMapping("tree-data")
    @ResponseBody
    public ResponseResult<List<TreeDataResult>> treeData() {
        List<Area> areaList = SystemCacheUtils.getAreaList();
        List<TreeDataResult> treeDataResultList = toTreeDataResult(areaList);
        return success(treeDataResultList);
    }


    /**
     * 将区域列表转换为树形结构
     *
     * @param areaList
     * @return
     */
    private List<TreeDataResult> toTreeDataResult(List<Area> areaList) {

        if (areaList == null || areaList.isEmpty()) {
            return null;
        }

        List<TreeDataResult> treeDataResultList = Lists.newArrayList();
        for (Area area : areaList) {
            TreeDataResult treeDataResult = new TreeDataResult();
            treeDataResult.setId(area.getId());
            treeDataResult.setText(area.getName());

            if (area.getSubAreaList() != null && !area.getSubAreaList().isEmpty()) {
                treeDataResult.setIcon("fa fa-folder icon-state-warning");
            } else {
                treeDataResult.setIcon("fa fa-file icon-state-default");
            }
            if (area.getParent().getId().equals("0")) {
                treeDataResult.setState(new TreeDataResult.State(true));
            }
            treeDataResult.setChildren(toTreeDataResult(area.getSubAreaList()));
            treeDataResultList.add(treeDataResult);
        }
        return treeDataResultList;
    }


    /**
     * 区域显示
     * @param parentId
     * @return
     */
    @RequestMapping("show")
    public String show(String parentId , Model model){
        if(StringUtils.isBlank(parentId)){
            throw  new RuntimeException("parentId is null");
        }
        List<Area> subAreaList = areaService.getByParentId(parentId);

        if(subAreaList == null || subAreaList.isEmpty()){
            Area area = areaService.get(parentId);
            model.addAttribute("area" , area);
            return "system/area_edit";
        }else {
            model.addAttribute("subAreaList" , subAreaList);
            model.addAttribute("parentId" , parentId);
        }
        return "system/area_show";
    }


    /**
     * 区域添加，编辑
     * @param id
     * @return
     */
    @RequestMapping("edit")
    public String edit(String id, String parentId, Model model) {
        if (StringUtils.isBlank(id) && StringUtils.isBlank(parentId)) {
            throw new RuntimeException("id and parentId is null");
        }
        Area area = null;
        if (parentId != null) {
            //新增顶级区域
            if (parentId.equals("0")) {
                area = new Area();
                Area topArea = new Area("0");
                topArea.setName("顶级区域");
                area.setParent(topArea);
            } else {
                area = new Area();
                area.setParent(areaService.get(parentId));
            }
        } else {
            area = areaService.get(id);
        }
        model.addAttribute("area", area);
        return "system/area_edit";
    }


    /**
     * 区域保存
     * @param area
     */
    @RequestMapping("save")
    public String saveOrUpdate(Area area , RedirectAttributes redirectAttributes, HttpServletRequest request){
        areaService.save(area);
        SystemCacheUtils.clearSystemCache(SystemCacheUtils.DEPARTMENT_LIST);
        redirectAttributes.addFlashAttribute("message", "保存区域'" + area.getName() + "'成功");
        redirectAttributes.addAttribute("parentId",area.getParent().getId());
        return "redirect:" + adminPath + "/system/area/show";
    }

    /**
     * 区域删除
     * @param id
     * @return
     */
    @RequestMapping("del")
    @ResponseBody
    public ResponseResult delete(String id){
        areaService.deleteAndChild(new Area(id));
        SystemCacheUtils.clearSystemCache(SystemCacheUtils.DEPARTMENT_LIST);
        return  success("删除成功");
    }

}
