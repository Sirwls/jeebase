<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>部门编辑</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <%@ include file="/WEB-INF/view/global/head-lib.jsp"%>
    <link href="${staticPath}/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
    <script src="${staticPath}/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
    <script src="${staticPath}/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="${staticPath}/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
</head>
<body>

<div class="page-inner-container" style="padding: 0px 15px">
    <div class="row">
        <div class="portlet  light  bordered">
            <div class="portlet-title">
                <div class="caption">
                    <i class="icon-bubble font-green"></i>
                    <span class="caption-subject font-blue-sharp bold uppercase">部门编辑</span>
                </div>
            </div>
            <div class="portlet-body">
                <form:form modelAttribute="dept" action="${adminPath}/system/dept/save" method="post" id="dept-form" class="form-horizontal">
                    <form:hidden path="id"/>
                    <form:hidden path="parent.id"/>
                    <div class="form-body">
                        <div class="alert alert-danger display-hide">
                            <button class="close" data-close="alert"></button>请保证表单信息填写正确</div>
                        <div class="form-group  margin-top-20">
                            <label class="control-label col-xs-3" style="text-align: right; padding-top:7px">名称
                                <span class="required"> * </span>
                            </label>
                            <div class="col-xs-4">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <form:input path="name" cssClass="form-control" htmlEscape="false"/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group  margin-top-20">
                            <label class="control-label col-xs-3" style="text-align: right; padding-top:7px">编码
                                <span class="required">* </span>
                            </label>
                            <div class="col-xs-4">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <form:input path="code" cssClass="form-control" htmlEscape="false"/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group  margin-top-20">
                            <label class="control-label col-xs-3" style="text-align: right; padding-top:7px">地址
                                <span class="required">  </span>
                            </label>
                            <div class="col-xs-4">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <form:input path="address" cssClass="form-control" htmlEscape="false"/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group  margin-top-20">
                            <label class="control-label col-xs-3" style="text-align: right; padding-top:7px">上级部门
                                <span class="required"> * </span>
                            </label>
                            <div class="col-xs-4">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <form:input path="parent.name" cssClass="form-control" htmlEscape="false" disabled="true"/>
                                 </div>
                            </div>
                        </div>

                        <div class="form-group  margin-top-20">
                            <label class="control-label col-xs-3" style="text-align: right; padding-top:7px">邮政编码
                                <span class="required"></span>
                            </label>
                            <div class="col-xs-4">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <form:input path="zipCode" cssClass="form-control"  htmlEscape="false"/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group  margin-top-20">
                            <label class="control-label col-xs-3" style="text-align: right; padding-top:7px">电话
                                <span class="required"></span>
                            </label>
                            <div class="col-xs-4">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <form:input path="phone" cssClass="form-control"  htmlEscape="false"/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group  margin-top-20">
                            <label class="control-label col-xs-3" style="text-align: right; padding-top:7px">传真
                                <span class="required"></span>
                            </label>
                            <div class="col-xs-4">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <form:input path="fax" cssClass="form-control"  htmlEscape="false"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group  margin-top-20">
                            <label class="control-label col-xs-3" style="text-align: right; padding-top:7px">邮箱
                                <span class="required"> </span>
                            </label>
                            <div class="col-xs-4">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <form:input path="email" cssClass="form-control"  htmlEscape="false"/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group  margin-top-20">
                            <label class="control-label col-xs-3" style="text-align: right; padding-top:7px">所属区域
                                <span class="required">  </span>
                            </label>
                            <div class="col-xs-4">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <form:input path="area.name" cssClass="form-control"  htmlEscape="false"/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group  margin-top-20">
                            <label class="control-label col-xs-3" style="text-align: right; padding-top:7px">负责人
                                <span class="required">  </span>
                            </label>
                            <div class="col-xs-4">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <form:input path="master.name" cssClass="form-control"  htmlEscape="false"/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group  margin-top-20">
                            <label class="control-label col-xs-3" style="text-align: right; padding-top:7px">排序
                                <span class="required"> * </span>
                            </label>
                            <div class="col-xs-4">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <form:input path="sort" cssClass="form-control"  htmlEscape="false"/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group  margin-top-20">
                            <label class="control-label col-xs-3" style="text-align: right; padding-top:7px">是否可用
                                <span class="required"></span>
                            </label>
                            <div class="col-xs-4">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                <form:checkbox path="useable"  value="1"  cssClass="make-switch form-control"  data-size="small"/>
                            </div>
                        </div>
                    </div>
                        <div class="form-group  margin-top-20">
                            <label class="control-label col-xs-3" style="text-align: right; padding-top:7px">备注
                                <span class="required"> </span>
                            </label>
                            <div class="col-xs-4">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <form:textarea path="remarks" cssClass="form-control" htmlEscape="false"/>
                                </div>
                            </div>
                        </div>
                    <div class="form-actions">
                        <div class="row">
                            <div class="col-xs-offset-3 col-xs-9">
                                <input type="submit" class="btn green" value="保存"/>
                                <input type="button" class="btn default" value="返回" onclick="location.href='${adminPath}/system/dept/show?parentId=${dept.parent.id}'"/>
                            </div>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
    </div>
</div>

<script>

    var FormValidation = function () {

        var handleValidation = function () {
            var deptForm = $('#dept-form');
            var error = $('.alert-danger', deptForm);

            deptForm.validate({
                errorElement: 'span',
                errorClass: 'help-block help-block-error',
                focusInvalid: false,
                ignore: "",
                rules: {
                    name: {
                        minlength: 2,
                        required: true
                    },
                    sort:{
                        required: true,
                        number: true,
                        min : 0
                    },
                    code:{
                        required:true
                    }
                },

                invalidHandler: function (event, validator) {
                    error.show();
                },

                errorPlacement: function (error, element) {
                    var icon = $(element).parent('.input-icon').children('i');
                    icon.removeClass('fa-check').addClass("fa-warning");
                },

                highlight: function (element) {
                    $(element).closest('.form-group').removeClass("has-success").addClass('has-error');
                },

                success: function (label, element) {
                    var icon = $(element).parent('.input-icon').children('i');
                    $(element).closest('.form-group').removeClass('has-error').addClass('has-success');
                    icon.removeClass("fa-warning").addClass("fa-check");
                },

                submitHandler: function (form) {
                    form.submit();
                }
            });

        }
        return {
            init: function () {
                handleValidation();
            }
        }
    }();
    $(document).ready(function () {
        FormValidation.init();
    });
</script>
</body>
</html>