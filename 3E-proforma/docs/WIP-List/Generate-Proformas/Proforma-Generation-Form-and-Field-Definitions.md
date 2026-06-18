### **Proforma Generation Form and Field Definitions**

The Proforma Generation form is used to configure settings for creating proformas for matters in the [<u>WIP list</u>](../WIP-List-Form-and-Field-Definitions.md#wip-list-form-and-field-definitions). This form is accessed when the Generation action is initiated from the WIP List for one or more listed matters.

![](/img/media/image123.png)
| <strong>Field Names</strong> | <strong>Descriptions</strong> |
|---|---|
| <strong>Create Tab</strong> |  |
| <strong>Co-Owner</strong> | Select a timekeeper in this field to assign as a co-owner for the proforma run. |
| <strong>Description</strong> | Type a maximum of 64 alphanumeric characters as the description for this proforma generation |
| <strong>Invoice Date</strong> | Type or select the date of the invoice used to produce the proforma. |
| <strong>Proforma status</strong> | From the drop-down list, select the status to be assigned to the proforma when generated, such as Open, Approved, or Pending Review. The Proforma Status will be changed to Closed on a proforma when unbilled time or costs are transferred from this proforma to another. |
| <strong>Change status to</strong> | If including entries from other proformas, select a new status from the drop-down list to update the other proformas. This field becomes enabled when the <strong>Include Entries on Other Proformas</strong> check box is selected. |
| <strong>Create individual matter proformas</strong> | To generate an individual proforma number for each matter in the billing group, select this check box. To use the same proforma number for all matters in the bill group, do not select this check box. |
| <strong>Include entries on other proformas</strong> | To include unbilled entries from other proformas on this proforma, select this check box. When this check box is selected, you can click the Review Results button to determine if there are no conflicts before generating the proforma, e.g., any proformas being included are locked.<br/>In addition, timecards, cost cards, and/or charge cards on held proformas will not be removed to be included on the new proforma until the held proforma status is changed to a current status.<br/>When the check box is selected, time, cost and charge cards on Full Credit Note (FCN) proformas are not included. |
| <strong>Ignore excluded entries</strong> | Select this check box to ignore items excluded from other proformas.<br/><strong>Note</strong>: If the excluded item belongs to a closed or held proforma, this will have no effect, i.e., if you do not select this check box, then excluded entries will not be included if they are attached to a closed or held proforma. |
| <strong>Update proforma status for proformas without WIP</strong> | Select this check box to include proformas without WIP with the new proforma. Their status will be updated to match the value selected in the Change Status To drop-down list.<br/>This enables users to close prior proformas at the same time as their regular proforma run, eliminating the need to use the Proforma Global Status Change utility to close those proformas.<br/><strong>Note</strong>: This option is only available when the <strong>Include Entries on Other Proformas</strong> check box is selected. |
| <strong>Time start</strong> | Type or query to select the beginning date for the accumulated time entries to print. |
| <strong>Time end</strong> | Type or query to select the ending date for the accumulated time entries to print. |
| <strong>Cost start</strong> | Type or query to select the beginning date for the accumulated cost entries to print. |
| <strong>Cost end</strong> | Type or query to select the ending date for the accumulated cost entries to print. |
| <strong>Charge start</strong> | Type or query to select the beginning date for the accumulated charge entries to print. |
| <strong>Charge end</strong> | Type or query to select the ending date for the accumulated charge entries to print. |
| <strong>Matter list</strong> |  |
| <strong>Matter #</strong> | Displays the matter number |
| <strong>Matter</strong> | Displays the matter name |
| <strong>Client</strong> | Displays the name of the matter client |
| <strong>Bill Group</strong> | Displays the bill group to which the matter belongs. |
| <strong>Total WIP</strong> | Displays the total WIP amount. |
| <strong>Preview Tab</strong> |  |
| <strong>Single proforma</strong> | Displays the number of single proformas to be generated. |
| <strong>Group proforma</strong> | Displays the number of group proformas to be generated. |
| <strong>Generate</strong> | Displays the generation status |
| <strong>Group</strong> | Displays the bill group to which the proforma belongs. |
| <strong>Matter #</strong> | Displays the number of the matter for which the proforma is being generated. |
| <strong>Matter name</strong> | Displays the name of the matter for which the proforma is being generated. |
| <strong>Client</strong> | Displays the name of the matter client associated with the generated proforma. |
| <strong>Status</strong> | Displays the proforma status (e.g., New, Hold, or Locked). |
| <strong>Proforma #</strong> | Displays the number to be associated with the new proforma |
| <strong>Locked by user</strong> | Displays the name of the user actively working on a proforma selected with generation. |

 

