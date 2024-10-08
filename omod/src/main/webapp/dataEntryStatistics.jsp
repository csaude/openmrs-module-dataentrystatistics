
<%@ include file="/WEB-INF/template/include.jsp"%>

<openmrs:require privilege="View Data Entry Statistics"
	otherwise="/login.htm"
	redirect="/module/@MODULE_ID@/dataEntryStatistics.list" />

<%@ include file="/WEB-INF/template/header.jsp"%>

<%@ include file="/WEB-INF/view/admin/maintenance/localHeader.jsp"%>

<openmrs:htmlInclude file="/scripts/calendar/calendar.js" />


<openmrs:htmlInclude file="/scripts/validation.js" />

<h2>
	<spring:message code="dataentrystatistics.title" />
</h2>



<form method="post">
	<fieldset>
		<table style="width: 30%;">
			<tr>
				<td><spring:message code="dataentrystatistics.obsCreator" />:</td>
				<td><spring:bind path="command.obsCreator">
						<select name="${status.expression}">
							<c:forEach items="${roles}" var="role">
								<c:choose>
									<c:when test="${ role == command.obsCreator }">
										<option selected>${role}</option>
									</c:when>
									<c:otherwise>
										<option>${role}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</spring:bind></td>
			</tr>
			<tr id="orderByTr">
				<td><spring:message code="dataentrystatistics.orderBy" />:</td>
				<td><spring:bind path="command.orderBy">
						<select name="${status.expression}" width="60%" id="orderBy">
							<option></option>
							<c:forEach items="${orderBys}" var="orderBy">
								<c:choose>
									<c:when test="${ orderBy == command.orderBy }">
										<option selected>${orderBy}</option>
									</c:when>
									<c:otherwise>
										<option>${orderBy}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</spring:bind></td>
			</tr>
			<tr id="locationTr" style="display: true;">
				<td><spring:message code="dataentrystatistics.location" /></td>
				<td><spring:bind path="command.location">
						<openmrs_tag:locationField formFieldName="location"
							initialValue="${status.value}" />
						<c:if test="${status.errorMessage != ''}">
							<span class="error">${status.errorMessage}</span>
						</c:if>
					</spring:bind></td>
			</tr>

			<tr id="reportTypeTr">
				<td><spring:message code="dataentrystatistics.type" />:</td>
				<td><spring:bind path="command.reportType">

						<select name="${status.expression}" width="60%" id="reportType">
							<option></option>
							<c:forEach items="${reportTypes}" var="reportType">
								<c:choose>
									<c:when test="${ reportType == command.reportType }">
										<option selected>${reportType}</option>
									</c:when>
									<c:otherwise>
										<option>${reportType}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</spring:bind></td>
			</tr>

			<tr id="startDateTr">
				<td><spring:message code="dataentrystatistics.startDate" />:</td>
				<td><spring:bind path="command.fromDate">
						<input type="text" name="${status.expression}" size="10"
							value="${status.value}" id="startDate" />
						<c:if test="${command.fromDate > command.toDate}">
							<span class="error"> Start Date > End Date </span>
						</c:if>
					</spring:bind></td>
			</tr>

			<tr id="endDateTr">
				<td><spring:message code="dataentrystatistics.endDate" />:</td>
				<td><spring:bind path="command.toDate">
						<input type="text" name="${status.expression}" size="10"
							value="${status.value}" id="endDate" />
					</spring:bind></td>
			</tr>

			<tr id="fromMonthTr">
				<td><spring:message code="dataentrystatistics.startMonth" />:</td>
				<td><spring:bind path="command.fromMonth">
						<input type="text" name="${status.expression}" size="10"
							value="${status.value}" id="fromMonth" />
						<c:if test="${status.errorMessage != ''}">
							<span class="error">${status.errorMessage}</span>
						</c:if>
					</spring:bind></td>
			</tr>

			<tr id="toMonthTr">
				<td><spring:message code="dataentrystatistics.endMonth" />:</td>
				<td><spring:bind path="command.toMonth">
						<input type="text" name="${status.expression}" size="10"
							value="${status.value}" id="toMonth" />
						<c:if test="${status.errorMessage != ''}">
							<span class="error">${status.errorMessage}</span>
						</c:if>
					</spring:bind></td>
			</tr>

			<tr id="hideTr" style="display: none;">
				<td><spring:message code="dataentrystatistics.hideAverageObs" />:</td>
				<td><spring:bind path="command.hideAverageObs">
						<input type="hidden" name="_${status.expression}" />
						<input type="checkbox" name="${status.expression}"
							<c:if test="${status.value}">checked</c:if> />
						<c:if test="${status.errorMessage != ''}">
							<span class="error">${status.errorMessage}</span>
						</c:if>
					</spring:bind></td>
			</tr>

			<tr>
				<td></td>
				<td><input type="submit" name="view"
					value="<spring:message code="general.view"/>" />&nbsp;&nbsp;
				<td><input type="submit" name="downloadWithPassword"
					value="Download Protected Excel File " /></td>
				<td><c:if test="${isMAOfficial eq true}">
						<input type="submit" name="downloadWithoutPassword"
							value="Download Unprotected Excel File">
					</c:if></td>
			</tr>
		</table>
	</fieldset>
</form>

<p />

<c:out value="${command.table.htmlTable}" escapeXml="false" />

<openmrs:htmlInclude
	file="/moduleResources/dataentrystatistics/jquery-1.11.0.min.js" />
<openmrs:htmlInclude
	file="/moduleResources/dataentrystatistics/jquery.min.js" />
<openmrs:htmlInclude
	file="/moduleResources/dataentrystatistics/jquery-ui.min.js" />

<openmrs:htmlInclude
	file="/moduleResources/dataentrystatistics/form-type.css" />
<openmrs:htmlInclude
	file="/moduleResources/dataentrystatistics/form-type.js" />

<%@ include file="/WEB-INF/template/footer.jsp"%>