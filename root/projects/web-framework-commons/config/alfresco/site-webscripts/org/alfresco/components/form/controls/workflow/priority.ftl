<#include "/org/alfresco/components/form/controls/common/utils.inc.ftl" />
<div class="form-field">
   <#if form.mode == "view" || (form.mode == "edit" && field.disabled)>
      <div class="viewmode-field">
         <span class="viewmode-label">${field.label?html}:</span>
         <span class="viewmode-value">
         <#if field.value?string == "1">${msg("form.control.priority.high")}
         <#elseif field.value?string == "2">${msg("form.control.priority.medium")}
         <#elseif field.value?string == "3">${msg("form.control.priority.low")}
         <#else>${field.value?html}</#if>
         </span>
      </div>
   <#else>
      <label for="${fieldHtmlId}">${field.label?html}:<#if field.mandatory><span class="mandatory-indicator">${msg("form.required.fields.marker")}</span></#if></label>
      <select id="${fieldHtmlId}" name="${field.name}" tabindex="0" size="1"
            <#if field.description?exists>title="${field.description}"</#if>
            <#if field.control.params.styleClass?exists>class="${field.control.params.styleClass}"</#if>
            <#if field.disabled>disabled="true"</#if>>
            <option value="1"<#if field.value?string == "1"> selected="selected"</#if>>${msg("form.control.priority.high")}</option>
            <option value="2"<#if field.value?string == "2"> selected="selected"</#if>>${msg("form.control.priority.medium")}</option>
            <option value="3"<#if field.value?string == "3"> selected="selected"</#if>>${msg("form.control.priority.low")}</option>
      </select>
   </#if>
</div>