<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">   
   <meta name="Generator" content="Alfresco Repository">

   <style type="text/css">
      body {
         background-color:#FFFFFF;
         color:#000000;
      }
      * {
         font-family:Verdana,Arial,sans-serif;
         font-size:11px;
      }
      h1 {
         text-align:left;
         font-size:15px;
      }
      h2 {
         text-align:left;
         font-size:13px;
      }
      fieldset {
         border:1px dotted #555555;
         margin:15px 5px 15px 5px;
      }
      fieldset legend {
         font-weight:bold;
         border:1px dotted #555555;
         background-color: #FFFFFF;
         padding:7px;
      }
      .links {
         border:0;
         border-collapse:collapse;
         width:99%;
      }
      .links td {
         border:0;
         padding:5px;
      }
      .description {
         border:0;
         border-collapse:collapse;
         width:99%;
      }
      .description td {
         /*border:1px dotted #555555;*/
         padding:5px;
      }
      #start_workflow input, #start_workflow select, #start_workflow textarea
      {
         border:1px solid #555555;
      }
   </style>
</head>
<body>
<hr/>
<h1> Document (name):   ${document.name} </h1>
<hr/>
<fieldset>
<legend> Metadata </legend>
<table class="description">
   <#if document.properties.title?exists>
                     <tr><td valign="top">Title:</td><td>${document.properties.title}</td></tr>
   <#else>
                     <tr><td valign="top">Title:</td><td>&nbsp;</td></tr>
   </#if>
   <#if document.properties.description?exists>
                     <tr><td valign="top">Description:</td><td>${document.properties.description}</td></tr>
   <#else>
                     <tr><td valign="top">Description:</td><td>&nbsp;</td></tr>
   </#if>
                     <tr><td>Creator:</td><td>${document.properties.creator}</td></tr>
                     <tr><td>Created:</td><td>${document.properties.created?datetime}</td></tr>
                     <tr><td>Modifier:</td><td>${document.properties.modifier}</td></tr>
                     <tr><td>Modified:</td><td>${document.properties.modified?datetime}</td></tr>
                     <tr><td>Size:</td><td>${document.size / 1024} Kb</td></tr>
</table>
</fieldset>
<fieldset>
<legend> Content links </legend>
<table class="links">
   <tr>
   <td>Content folder:</td><td><a href="${contextUrl}/navigate/browse${document.displayPath}">${contextUrl}/navigate/browse${document.displayPath}</a></td>
   </tr>
   <tr>
   <td>Content URL:</td><td><a href="${contextUrl}${document.url}">${contextUrl}${document.url}</a></td>
   </tr>
   <tr>
   <td>Download URL:</td><td><a href="${contextUrl}${document.downloadUrl}">${contextUrl}${document.downloadUrl}</a></td>
   </tr>
   <tr>
   <td>WebDAV URL:</td><td><a href="${contextUrl}${document.webdavUrl}">${contextUrl}${document.webdavUrl}</a></td>
   </tr>
</table>
</fieldset>
<fieldset>
<legend> Start Workflow </legend>
<form id="start_workflow"
      name="start_workflow"
      method="post"
      action="${contextUrl}/service/imap/start-workflow"
      enctype="application/x-www-form-urlencoded">
   <input type="hidden" name="alfTicket" value="${alfTicket}" />
   <input type="hidden" name="nodeRefId" value="${document.id}" />
   <table>
      <tr>
         <td>Workflow type:</td>
         <td>
            <!-- Workflow list is hardcoded for now -->
            <select id="workflowType" name="workflowType" style="width:134px">
               <option value="adhoc">Adhoc Task</option>
               <option value="review">Review & Approve</option>
            </select>
         </td>
      </tr>
      <tr>
         <td>Asign to:</td>
         <td>
            <input type="text" id="assignTo" name="assignTo"/>
         </td>
      </tr>
      <tr>
         <td>Priority:</td>
         <td>
            <select size="1" name="workflowPriority" id="workflowPriority">
               <option value="1">1</option>
               <option selected="selected" value="2">2</option>
               <option value="3">3</option>
            </select>
         </td>
      <tr>
         <td>Due date:</td>
         <td>
            Day: <select size="1" name="workflowDueDateDay" id="workflowDueDateDay">
                <option selected="selected" value="1">1</option>
                  <#list 2..31 as i>
                     <option value="${i}">${i}</option>
                  </#list> 
                </select>
            </select>&nbsp;
            Month: <select size="1" name="workflowDueDateMonth" id="workflowDueDateMonth">
                  <option selected="selected" value="1">1</option>
                  <#list 2..12 as i>
                     <option value="${i}">${i}</option>
                  </#list> 
                 </select>&nbsp;
            Year: <input type="text" size="5" id="workflowDueDateYear" name="workflowDueDateYear"/>
         </td>
      </tr>
      <tr>
         <td>Description:</td><td><textarea style="width:132px" id="description" name="description"></textarea></td>
      </tr>
      <tr>
         <td colspan="2"><center><input id="submitButton" type="submit" value="Start workflow" style="margin:20px 5px 5px 5px"/></center></td>
      </tr>
   </table>
</form>
</fieldset>
<!--
   JBPM ids for debug....
id=jbpm$4,name=jbpm$wcmwf:changerequest,version=1,title=Change Request
id=jbpm$3,name=jbpm$wcmwf:submit,version=1,title=Web Site Submission
id=jbpm$5,name=jbpm$wcmwf:submitdirect,version=1,title=Web Site Submission (Direct)
id=jbpm$2,name=jbpm$wf:adhoc,version=1,title=Adhoc Task
id=jbpm$6,name=jbpm$wf:invite,version=1,title=Site Invite
id=jbpm$1,name=jbpm$wf:review,version=1,title=Review & Approve
-->
</body>
</html>