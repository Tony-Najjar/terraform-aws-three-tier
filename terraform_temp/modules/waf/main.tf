resource "aws_wafv2_web_acl" "main" {

  name  = "${var.project_name}-waf"
  scope = "CLOUDFRONT"

  default_action {
    allow {}
  }


  visibility_config {

    cloudwatch_metrics_enabled = true
    metric_name                = "${var.project_name}-waf"
    sampled_requests_enabled   = true

  }


  rule {

    name     = "AWSManagedCommonRules"
    priority = 1


    override_action {
      none {}
    }


    statement {

      managed_rule_group_statement {

        name        = "AWSManagedRulesCommonRuleSet"
        vendor_name = "AWS"

      }

    }


    visibility_config {

      cloudwatch_metrics_enabled = true
      metric_name                = "CommonRules"
      sampled_requests_enabled   = true

    }

  }


  rule {

    name     = "AWSManagedSQLInjectionRules"
    priority = 2


    override_action {
      none {}
    }


    statement {

      managed_rule_group_statement {

        name        = "AWSManagedRulesSQLiRuleSet"
        vendor_name = "AWS"

      }

    }


    visibility_config {

      cloudwatch_metrics_enabled = true
      metric_name                = "SQLInjectionRules"
      sampled_requests_enabled   = true

    }

  }

}
