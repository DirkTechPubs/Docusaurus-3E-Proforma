## 3E Proforma System Options

| <strong>Option</strong> | <strong>Description</strong> | <strong>Default Setting</strong> |
|---|---|---|
| <strong>3EProformaChargeDetailSortAttr</strong> | 3E Proforma Charge Details Sorting Attribute | Date |
| <strong>3EProformaCostDetailSortAttr</strong> | 3E Proforma Cost Details Sorting Attribute | Date |
| <strong>3EProformaFeeDetailSortAttr</strong> | 3E Proforma Fee Details Sorting Attribute | Date |
| <strong>3EProformaListSortAttr</strong> | 3E Proforma List View Sorting Attribute | Clients Name |
| <strong>3EProformaProfDetailChargeSortDirection</strong> | Used in 3E Proforma for the Charge details child | Ascending |
| <strong>3EProformaProfDetailCostSortDirection</strong> | Used in 3E Proforma for the Cost details child | Ascending |
| 3EProformaProfDetailTimeSortDirection | Used in 3E Proforma for the Fee/Time details child | Ascending |
| <strong>3EProformaProfListViewSortDirection</strong> | Used as the default sort for the Proforma List | Ascending |
| <strong>3EProformaUseWorkNarrative</strong> | When True, work narrative is edited in 3E Proforma, when false, presentation narrative is edited in 3E Proforma. | True |
| <strong>3EProformaWriteOffType</strong> | Defines the attribute used for Write-Off Fees and Write-Off Costs functionality. Options are Billable Purge, No Charge, and Write Down. | Billable Purge |
| <strong>Action_notification_autohide_delay</strong> | Delay in milliseconds before action success/failures action results fade away | 20 sec |
| Allow WF_Prof_Edit_Payor | Allows users to view proforma payor information on the proforma | None |
| <strong>ChargeDetail_BNP_Requires_Comment</strong> | <strong>Comments</strong> field on a charge card is mandatory field when the <strong>BNP</strong> action is selected | False |
| <strong>ChargeDetail_NB_Requires_Comment</strong> | <strong>Comments</strong> field on a charge card is mandatory field when the <strong>Non-billable</strong> action is selected | False |
| <strong>ChargeDetail_NoCharge_Requires_Comment</strong> | <strong>Comments</strong> field on a charge card is mandatory field when the <strong>No Charge</strong> action is selected | False |
| <strong>ChargeDetail_WriteDown_Requires_Comment</strong> | <strong>Comments</strong> field on a charge card is mandatory field when the <strong>Write Down</strong> action is selected | False |
| <strong>Commit_cardactions</strong> | Commits <strong>Exclude, Transfer,</strong> <strong>Combine</strong>, and <strong>Purge card</strong> actions to the 3E database<br/><strong>Excludes</strong><br/>If set to <strong>False</strong>, a biller will be required to review and finalize the Exclude action in Proforma Edit by clicking on ProcExlude action.<br/>If set to <strong>True</strong>, the Exclude action is performed automatically in 3E Proforma on the Save &amp; recalc/Save &amp; close/Submit actions.<br/><strong>Transfers</strong><br/>If set to <strong>False</strong>, a biller will be required to review and finalize the Transfer action in Proforma Edit by clicking on ProcTransfer action.<br/>If set to <strong>True</strong>, the Transfer action is performed automatically in 3E Proforma on the Save &amp; recalc/Save &amp; close/Submit actions.<br/><strong>Divides</strong><br/>If set to <strong>False</strong>, a biller will be required to review and finalize the Divide action in Proforma Edit by clicking on ProcTransfer or ProcExlude action.<br/>If set to <strong>True</strong>, the Divide action is performed automatically in 3E Proforma on the Save &amp; recalc/Save &amp; close/Submit actions.<br/><strong>Process Transfers in 3E</strong><br/>If the <strong>ProcTransfer</strong> action (a.k.a., Process Transfer)is selected in Proforma Edit, and <strong>Commit_cardactions</strong> is set to <strong>True</strong>, Transfers, Divides, and Excludes are processed. | False |
| <strong>CostDetail_BNP_Requires_Comment</strong> | <strong>Comments</strong> field on a cost card is mandatory field when the <strong>BNP</strong> action is selected | False |
| <strong>CostDetail_NB_Requires_Comment</strong> | <strong>Comments</strong> field on a cost card is mandatory field when the <strong>Non-billable</strong> action is selected | False |
| <strong>CostDetail_NoCharge_Requires_Comment</strong> | <strong>Comments</strong> field on a cost card is mandatory field when the <strong>No Charge</strong> action is selected | False |
| <strong>CostDetail_WriteDown_Requires_Comment</strong> | <strong>Comments</strong> field on a cost card is mandatory field when the <strong>Write Down</strong> action is selected | False |
| <strong>Days to Archive Deferred Proformas</strong> | Defines the number of days until deferred proformas are moved to Archived proformas. The number of days is added to the date when proforma was generated (there is no way to add to the date when proforma was deferred). | 10 |
| <strong>DaysToUrgent</strong> | Defines the number of days until a proforma is marked as urgent | 10 |
| <strong>Notify_EmailOnAddCollaborator</strong> | When true, sends an email notification to collaborators when they are added to a proforma. | False |
| <strong>Notify_EmailOnForward</strong> | When true, sends an email notification to a user when a proforma is forwarded to them. | False |
| <strong>ProformaDetail_DisplayAllForNonOwners</strong> | If set to True, all cards are displayed for all timekeepers/fee earners.<br/>If set to False, non-owners will only see their own cards. | False |
| <strong> </strong> | <strong>Note: </strong> If any one of these conditions are met, the user will see all cards:<br/>"ProformaDetail_DisplayAllForNonOwners" option is set to <strong>True</strong><br/>User is assigned to the Approver Role<br/>Current timekeeper/fee earner was added as an Editor (or forwarded the proforma) by the BillTkpr, SuprTkpr, or RspTkpr of the proforma<br/>User is an effective dated timekeeper/fee earner on the matter |  |
| <strong>ProformaDetail_Pagesize</strong> | Control the page size for time, cost, and charge details sections. Values that can be set are 10, 20, 25, 50, 100. | 25 |
| <strong>ProformaList_Pagesize</strong> | Control the default page size for all proforma lists.<br />Available options are 10, 20, 25, 50 | 25 |
| <strong>ProformaStatus_Closed_Code</strong> | Proforma status to use when closing an unprocessed proforma | Closed |
| <strong>ProformaStatus_Closed_Processed_Code</strong> | Proforma status to use when closing a processed proforma | SAVEEDITS |
| <strong>ProformaStatus_Defer_Code</strong> | Proforma status to use when deferring a proforma | Defer |
| <strong> </strong> | <strong>Note:</strong> This should be updated for each Firm based on the status code they have set in the proforma status process for Hold. This status should not have Save Edits = True. |  |
| <strong>ProformaStatus_Undefer_Code</strong> | Proforma status to use when undeferring a proforma | Current |
| <strong> </strong> | <strong>Note:</strong> This should be updated for each Firm based on the status code they have set in the proforma status process for Hold. |  |
| <strong>Show_WIP</strong> | Enables Billing Timekeepers/Fee Earners to see their WIP List Items and generate proformas | False |
| <strong> </strong> | <strong>Note:</strong> This option was moved to the 3E Proforma Security group as of 3E 5.8/3E on prem 3.2. |  |
| <strong>TimeDetail_BNP_Requires_Comment</strong> | <strong>Comments</strong> field on a time card is mandatory field when the <strong>BNP</strong> action is selected | False |
| <strong>TimeDetail_NB_Requires_Comment</strong> | <strong>Comments</strong> field on a time card is mandatory field when the <strong>Non-billable</strong> action is selected | False |
| <strong>TimeDetail_NoCharge_Requires_Comment</strong> | <strong>Comments</strong> field on a time card is mandatory field when the <strong>No Charge</strong> action is selected | False |
| <strong>TimeDetail_WriteDown_Requires_Comment</strong> | <strong>Comments</strong> field on a time card is mandatory field when the <strong>Write Down</strong> action is selected | False |
| <strong>Update Presentation Narrative</strong> | Update presentation narrative | True |
| <strong>Use Billing Workflow</strong> | Enables the use of 3E Proforma Billing Workflow | False |
| <strong> </strong> | <strong>Note:</strong> This setting MUST be set to True as per the “Before You Begin” checklist. |  |
| <strong> </strong> |  |  |

 

