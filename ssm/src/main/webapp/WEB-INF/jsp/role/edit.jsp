<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/commons/global.jsp"%>
<script type="text/javascript">

    $(function () {

        var purl = '${basePath}role/edit.json?id=${role.id}';
        $("#frmEdit").form({
            url: purl,
            onSubmit: function (param) {
                $('#dlg_btn_add').linkbutton('disable');    //点击就禁用按钮，防止连击
                var isValid = $(this).form('validate');
                if (!isValid) {
                    $('#dlg_btn_add').linkbutton('enable');
                }
                return isValid;
            },
            success: function (resp) {
                resp = $.parseJSON(resp);
                if (resp.success) {
                    parent.$.modalDialog.openner_grid.datagrid('reload').datagrid('clearSelections');//之所以能在这里调用到parent.$.modalDialog.openner_tgrid这个对象，是因为resource.jsp页面预定义好了
                    parent.$.modalDialog.handler.dialog('close');
                }
                else {
                    $('#dlg_btn_add').linkbutton('enable');
                    alert("操作失败：" + resp.msg);
                }
            }
        });

    });

</script>
<div style="padding: 15px; overflow: hidden">
    <form id="frmEdit" method="post">
        <table style="width: 100%;" class="tbform">
            <tr>
                <td>
                    角色名称：
                </td>
                <td>
                    <input id="name" name="name" type="text" placeholder="请输入角色名称" class="easyui-textbox" data-options="required:true" value="${role.name}" />
                </td>
                <td>
                    顺序：
                </td>
                <td>
                    <input id="sort" name="sort" type="text" class="easyui-textbox" data-options="required:true" value="${role.sort}" />
                </td>
            </tr>
            <tr>
                <td>
                    备注：
                </td>
                <td colspan="3">
                    <input id="note" name="note" class="easyui-textbox" data-options="multiline:true" style="width:300px;height:50px" value="${role.note}"/>
                </td>
            </tr>
        </table>
    </form>
</div>
