module "s3" {
  source = "git::https://github.com/terraform-yc-modules/terraform-yc-s3.git"

  bucket_name = "diplo-bucket"
  max_size = 1073741824
}

resource "yandex_resourcemanager_folder_iam_member" "admin-account-iam" {
  folder_id   = var.folder_id
  role        = "ydb.editor"
  member      = "serviceAccount:${module.s3.storage_admin_service_account_id}"
}

data "template_file" "s3-key-template" {
  template = file("s3.tf.tpl")
  vars = {
    access_key = module.s3.storage_admin_access_key
    secret_key = nonsensitive(module.s3.storage_admin_secret_key)
  }
}

resource "local_file" "s3_file" {
  filename = "../../diplo_keys/s3.key"
  content  = data.template_file.s3-key-template.rendered
}

