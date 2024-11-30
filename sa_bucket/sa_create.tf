#Infrastructure service account creation
resource "yandex_iam_service_account" "diplom-sa" {
  name        = "diplom-sa"
  description = "service account for diploma project"
}

# Assigning a role to a service account
resource "yandex_resourcemanager_folder_iam_member" "sa-comp-ed" {
  folder_id = var.folder_id
  role      = "compute.editor"
  member    = "serviceAccount:${yandex_iam_service_account.diplom-sa.id}"
}

resource "yandex_resourcemanager_folder_iam_member" "sa-vpc-ad" {
  folder_id = var.folder_id
  role      = "vpc.admin"
  member    = "serviceAccount:${yandex_iam_service_account.diplom-sa.id}"
}

resource "yandex_iam_service_account_key" "sa-auth-key" {
  service_account_id = yandex_iam_service_account.diplom-sa.id
  description        = "key for diploma service account"
}

resource "local_file" "sa_auth_key" {
  content  = jsonencode({
  "id": "${yandex_iam_service_account_key.sa-auth-key.id}",
  "service_account_id": "${yandex_iam_service_account_key.sa-auth-key.service_account_id}",
  "created_at": "${yandex_iam_service_account_key.sa-auth-key.created_at}",
  "key_algorithm": "${yandex_iam_service_account_key.sa-auth-key.key_algorithm}",
  "public_key": "${yandex_iam_service_account_key.sa-auth-key.public_key}",
  "private_key": "${yandex_iam_service_account_key.sa-auth-key.private_key}"
  })
  filename = "../../diplo_keys/sa_auth_key.json"
}