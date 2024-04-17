# This file exports the account id list from organization and stores
# then in ssm parameter store of aft management account

resource "aws_ssm_parameter" "account_list" {
  count     = lengh(data.aws_organizations_organization.account_list.account[*].id)
  name 	    = "/mm/aft/account_id/${lower(replace(data.aws_organizations_organization.account_list.accounts[count.index].name, " ", "_"))}"
  type      = "string"
  value     = data.aws_organizations_organization.account_list.accounts[count.index].id
  overwrite = false
}
