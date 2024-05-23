resource "aws_cloudwatch_event_rule" "every_5_minutes" {
  name        = "every_5_minutes_rule"
  description = "trigger lambda every 5 minute"
  schedule_expression = "rate(5 minutes)"
}

resource "aws_cloudwatch_event_target" "lambda_target" {
  rule      = aws_cloudwatch_event_rule.every_5_minutes.name
  target_id = "SendToLambda"
  arn       = "arn:aws:lambda:eu-central-1:864091587804:function:CSVReader"
}

resource "aws_lambda_permission" "allow_eventbridge" {
  statement_id  = "AllowExecutionFromEventBridge"
  action        = "lambda:InvokeFunction"
  function_name = "CSVReader"
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.every_5_minutes.arn
}



data "local_file" "csv_file" {
  filename = "C:/Users/X266458/OneDrive - MerckGroup/Desktop/Terraform_Pipeline/csv-lateralscl-set.csv"  # Replace with the actual path to your local CSV file
}

module "Lambda_read_invoke"{
    source = "./CSVReader_invoke"
    function_name ="CSVReader"
    input = jsonencode({
    "csv_data": base64encode(data.local_file.csv_file.content)
  })
}


module "Lambda_extract_invoke"{
    source = "./CSVExtractor_invoke"
    function_name="CSVExtractor"
      input = jsonencode({
      "body" = {
      "csv_data" = [
      [
        "\ufeffPMID",
        "Title",
        "Authors",
        "Citation",
        "First Author",
        "Journal/Book",
        "Publication Year",
        "Create Date",
        "PMCID",
        "NIHMS ID",
        "DOI",
      ],
      [
        "32029539",
        "Primary lateral sclerosis: consensus diagnostic criteria",
        "Turner MR, Barohn RJ, Corcia P, Fink JK, Harms MB, Kiernan MC, Ravits J, Silani V, Simmons Z, Statland J, van den Berg LH; Delegates of the 2nd International PLS Conference; Mitsumoto H.",
        "J Neurol Neurosurg Psychiatry. 2020 Apr;91(4):373-377. doi: 10.1136/jnnp-2019-322541. Epub 2020 Feb 6.",
        "Turner MR",
        "J Neurol Neurosurg Psychiatry",
        "2020",
        "2/8/2020",
        "PMC7147236",
        "",
        "10.1136/jnnp-2019-322541",
      ],
      [
        "35607838",
        "Amyotrophic lateral sclerosis mimics",
        "Kwan J, Vullaganti M.",
        "Muscle Nerve. 2022 Sep;66(3):240-252. doi: 10.1002/mus.27567. Epub 2022 May 24.",
        "Kwan J",
        "Muscle Nerve",
        "2022",
        "5/24/2022",
        "",
        "",
        "10.1002/mus.27567",
      ],
      [
        "33003004",
        "Amyotrophic Lateral Sclerosis and Other Motor Neuron Diseases",
        "Quinn C, Elman L.",
        "Continuum (Minneap Minn). 2020 Oct;26(5):1323-1347. doi: 10.1212/CON.0000000000000911.",
        "Quinn C",
        "Continuum (Minneap Minn)",
        "2020",
        "10/1/2020",
        "",
        "",
        "10.1212/CON.0000000000000911",
      ],
      [
        "37851042",
        "Amyotrophic Lateral Sclerosis and Other Motor Neuron Diseases",
        "Izenberg A.",
        "Continuum (Minneap Minn). 2023 Oct 1;29(5):1538-1563. doi: 10.1212/CON.0000000000001345.",
        "Izenberg A",
        "Continuum (Minneap Minn)",
        "2023",
        "10/18/2023",
        "",
        "",
        "10.1212/CON.0000000000001345",
      ],
      [
        "32217663",
        "Primary lateral sclerosis: diagnosis and management",
        "Turner MR, Talbot K.",
        "Pract Neurol. 2020 Aug;20(4):262-269. doi: 10.1136/practneurol-2019-002300. Epub 2020 Mar 26.",
        "Turner MR",
        "Pract Neurol",
        "2020",
        "3/29/2020",
        "",
        "",
        "10.1136/practneurol-2019-002300",
      ],
      [
        "26515618",
        "Patterns of Weakness, Classification of Motor Neuron Disease, and Clinical Diagnosis of Sporadic Amyotrophic Lateral Sclerosis",
        "Statland JM, Barohn RJ, McVey AL, Katz JS, Dimachkie MM.",
        "Neurol Clin. 2015 Nov;33(4):735-48. doi: 10.1016/j.ncl.2015.07.006. Epub 2015 Sep 8.",
        "Statland JM",
        "Neurol Clin",
        "2015",
        "10/31/2015",
        "PMC4629510",
        "NIHMS707578",
        "10.1016/j.ncl.2015.07.006",
      ],
      [
        "34243936",
        "Primary Lateral Sclerosis: Clinical, radiological and molecular features",
        "Bede P, Pradat PF, Lope J, Vourc'h P, Blasco H, Corcia P.",
        "Rev Neurol (Paris). 2022 Mar;178(3):196-205. doi: 10.1016/j.neurol.2021.04.008. Epub 2021 Jul 6.",
        "Bede P",
        "Rev Neurol (Paris)",
        "2022",
        "7/10/2021",
        "",
        "",
        "10.1016/j.neurol.2021.04.008",
      ],
      [
        "23728653",
        "Therapeutic exercise for people with amyotrophic lateral sclerosis or motor neuron disease",
        "Dal Bello-Haas V, Florence JM.",
        "Cochrane Database Syst Rev. 2013 May 31;2013(5):CD005229. doi: 10.1002/14651858.CD005229.pub3.",
        "Dal Bello-Haas V",
        "Cochrane Database Syst Rev",
        "2013",
        "6/4/2013",
        "PMC6769061",
        "",
        "10.1002/14651858.CD005229.pub3",
      ],
      [
        "26515619",
        "Primary Lateral Sclerosis",
        "Statland JM, Barohn RJ, Dimachkie MM, Floeter MK, Mitsumoto H.",
        "Neurol Clin. 2015 Nov;33(4):749-60. doi: 10.1016/j.ncl.2015.07.007. Epub 2015 Sep 8.",
        "Statland JM",
        "Neurol Clin",
        "2015",
        "10/31/2015",
        "PMC4628724",
        "NIHMS712518",
        "10.1016/j.ncl.2015.07.007",
      ],
      [
        "7952238",
        "Amyotrophic lateral sclerosis",
        "Rowland LP.",
        "Curr Opin Neurol. 1994 Aug;7(4):310-5. doi: 10.1097/00019052-199408000-00006.",
        "Rowland LP",
        "Curr Opin Neurol",
        "1994",
        "8/1/1994",
        "",
        "",
        "10.1097/00019052-199408000-00006",
      ],
    ]
  }
  "statusCode" = 200
}
)
}


