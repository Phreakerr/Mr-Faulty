package com.faulty.model;

public class bugreportbean {

	public int getIssueID() {
		return issueID;
	}
	public void setIssueID(int issueID) {
		this.issueID = issueID;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getRationale() {
		return rationale;
	}
	public void setRationale(String rationale) {
		this.rationale = rationale;
	}
	public String getFaultDetails() {
		return faultDetails;
	}
	public void setFaultDetails(String faultDetails) {
		this.faultDetails = faultDetails;
	}
	public String getExpectedResult() {
		return expectedResult;
	}
	public void setExpectedResult(String expectedResult) {
		this.expectedResult = expectedResult;
	}
	public String getActualResult() {
		return actualResult;
	}
	public void setActualResult(String actualResult) {
		this.actualResult = actualResult;
	}
	public String getSubmitterUsername() {
		return submitterUsername;
	}
	public void setSubmitterUsername(String submitterUsername) {
		this.submitterUsername = submitterUsername;
	}
	private int issueID;
	private String summary;
	private String status;
	private String rationale;
	private String faultDetails;
	private String expectedResult;
	private String actualResult;
	private String submitterUsername;
}
