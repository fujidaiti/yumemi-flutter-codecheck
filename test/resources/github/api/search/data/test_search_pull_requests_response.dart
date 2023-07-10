/// 以下のコマンドで取得したJson
/// ```shell
/// curl -L \
///   -H "Accept: application/vnd.github+json" \
///   -H "X-GitHub-Api-Version: 2022-11-28" \
///   "https://api.github.com/search/issues?q=is:pr+state:open+repo:flutter/flutter&per_page=1"
/// ```
const testSearchPullRequestsResponse = r'''
{
  "total_count": 152,
  "incomplete_results": false,
  "items": [
    {
      "url": "https://api.github.com/repos/flutter/flutter/issues/129979",
      "repository_url": "https://api.github.com/repos/flutter/flutter",
      "labels_url":
          "https://api.github.com/repos/flutter/flutter/issues/129979/labels{/name}",
      "comments_url":
          "https://api.github.com/repos/flutter/flutter/issues/129979/comments",
      "events_url":
          "https://api.github.com/repos/flutter/flutter/issues/129979/events",
      "html_url": "https://github.com/flutter/flutter/pull/129979",
      "id": 1788867882,
      "node_id": "PR_kwDOAeUeuM5UqvZB",
      "number": 129979,
      "title":
          "Roll Flutter Engine from 987b621eac4e to 031c29f4f8cb (27 revisions)",
      "user": {
        "login": "engine-flutter-autoroll",
        "id": 42042535,
        "node_id": "MDQ6VXNlcjQyMDQyNTM1",
        "avatar_url": "https://avatars.githubusercontent.com/u/42042535?v=4",
        "gravatar_id": "",
        "url": "https://api.github.com/users/engine-flutter-autoroll",
        "html_url": "https://github.com/engine-flutter-autoroll",
        "followers_url":
            "https://api.github.com/users/engine-flutter-autoroll/followers",
        "following_url":
            "https://api.github.com/users/engine-flutter-autoroll/following{/other_user}",
        "gists_url":
            "https://api.github.com/users/engine-flutter-autoroll/gists{/gist_id}",
        "starred_url":
            "https://api.github.com/users/engine-flutter-autoroll/starred{/owner}{/repo}",
        "subscriptions_url":
            "https://api.github.com/users/engine-flutter-autoroll/subscriptions",
        "organizations_url":
            "https://api.github.com/users/engine-flutter-autoroll/orgs",
        "repos_url":
            "https://api.github.com/users/engine-flutter-autoroll/repos",
        "events_url":
            "https://api.github.com/users/engine-flutter-autoroll/events{/privacy}",
        "received_events_url":
            "https://api.github.com/users/engine-flutter-autoroll/received_events",
        "type": "User",
        "site_admin": false
      },
      "labels": [
        {
          "id": 284438921,
          "node_id": "MDU6TGFiZWwyODQ0Mzg5MjE=",
          "url": "https://api.github.com/repos/flutter/flutter/labels/engine",
          "name": "engine",
          "color": "003570",
          "default": false,
          "description": "flutter/engine repository. See also e: labels."
        },
        {
          "id": 4232992339,
          "node_id": "LA_kwDOAeUeuM78TlZT",
          "url":
              "https://api.github.com/repos/flutter/flutter/labels/autosubmit",
          "name": "autosubmit",
          "color": "0E8A16",
          "default": false,
          "description": "Merge PR when tree becomes green via auto submit App"
        }
      ],
      "state": "open",
      "locked": false,
      "assignee": null,
      "assignees": [],
      "milestone": null,
      "comments": 0,
      "created_at": "2023-07-05T06:33:43Z",
      "updated_at": "2023-07-05T06:35:15Z",
      "closed_at": null,
      "author_association": "CONTRIBUTOR",
      "active_lock_reason": null,
      "draft": false,
      "pull_request": {
        "url": "https://api.github.com/repos/flutter/flutter/pulls/129979",
        "html_url": "https://github.com/flutter/flutter/pull/129979",
        "diff_url": "https://github.com/flutter/flutter/pull/129979.diff",
        "patch_url": "https://github.com/flutter/flutter/pull/129979.patch",
        "merged_at": null
      },
      "body":
          "\nhttps://github.com/flutter/engine/compare/987b621eac4e...031c29f4f8cb\n\n2023-07-05 skia-flutter-autoroll@skia.org Roll Dart SDK from c89f5ac4fd46 to f7c242ded366 (1 revision) (flutter/engine#43410)\n2023-07-04 skia-flutter-autoroll@skia.org Roll Fuchsia Mac SDK from 8-taK-r4HkgVAIGtU... to 8YulTHvG-Jg3Sof-S... (flutter/engine#43409)\n2023-07-04 skia-flutter-autoroll@skia.org Roll Dart SDK from 7cd6ed860b63 to c89f5ac4fd46 (1 revision) (flutter/engine#43408)\n2023-07-04 skia-flutter-autoroll@skia.org Roll Dart SDK from d128bd4977a7 to 7cd6ed860b63 (1 revision) (flutter/engine#43406)\n2023-07-04 skia-flutter-autoroll@skia.org Roll Skia from eaca275ef1c0 to faf906db84ab (1 revision) (flutter/engine#43405)\n2023-07-04 skia-flutter-autoroll@skia.org Roll Dart SDK from e58e3bd3b507 to d128bd4977a7 (1 revision) (flutter/engine#43403)\n2023-07-04 skia-flutter-autoroll@skia.org Roll Fuchsia Mac SDK from GNWxBcnfjZlyaOw34... to 8-taK-r4HkgVAIGtU... (flutter/engine#43402)\n2023-07-04 skia-flutter-autoroll@skia.org Roll Skia from bb18c9b1f730 to eaca275ef1c0 (1 revision) (flutter/engine#43401)\n2023-07-04 skia-flutter-autoroll@skia.org Roll Dart SDK from 604ccea2f5b9 to e58e3bd3b507 (1 revision) (flutter/engine#43400)\n2023-07-04 skia-flutter-autoroll@skia.org Roll Skia from 85a3fda32850 to bb18c9b1f730 (3 revisions) (flutter/engine#43399)\n2023-07-04 49699333+dependabot[bot]@users.noreply.github.com Bump actions/labeler from 4.1.0 to 4.2.0 (flutter/engine#43398)\n2023-07-04 skia-flutter-autoroll@skia.org Roll Skia from 4abc43e2ffcc to 85a3fda32850 (1 revision) (flutter/engine#43393)\n2023-07-04 chinmaygarde@google.com [Impeller] Document `impeller::Context`. (flutter/engine#43389)\n2023-07-03 skia-flutter-autoroll@skia.org Roll Dart SDK from a4c5ed075a2b to 604ccea2f5b9 (1 revision) (flutter/engine#43390)\n2023-07-03 skia-flutter-autoroll@skia.org Roll Dart SDK from c092e09b7e64 to a4c5ed075a2b (1 revision) (flutter/engine#43387)\n2023-07-03 skia-flutter-autoroll@skia.org Roll Skia from 6a5ea15c942b to 4abc43e2ffcc (1 revision) (flutter/engine#43386)\n2023-07-03 skia-flutter-autoroll@skia.org Roll Fuchsia Mac SDK from cytps4RRhs8-wbcVJ... to GNWxBcnfjZlyaOw34... (flutter/engine#43373)\n2023-07-03 skia-flutter-autoroll@skia.org Roll Dart SDK from dedff8f0ebd2 to c092e09b7e64 (1 revision) (flutter/engine#43374)\n2023-07-03 skia-flutter-autoroll@skia.org Roll Skia from 94ad507b8959 to 6a5ea15c942b (1 revision) (flutter/engine#43385)\n2023-07-03 skia-flutter-autoroll@skia.org Roll Skia from e16d5b988a36 to 94ad507b8959 (2 revisions) (flutter/engine#43383)\n2023-07-03 skia-flutter-autoroll@skia.org Roll Skia from 384b84445a9f to e16d5b988a36 (1 revision) (flutter/engine#43382)\n2023-07-02 skia-flutter-autoroll@skia.org Roll Skia from dbf0829114ee to 384b84445a9f (2 revisions) (flutter/engine#43381)\n2023-07-01 bdero@google.com [Impeller] Remove blend mode restrictions on clear color optimization (flutter/engine#43348)\n2023-07-01 skia-flutter-autoroll@skia.org Roll Dart SDK from f00f7363f4bf to dedff8f0ebd2 (4 revisions) (flutter/engine#43371)\n2023-07-01 skia-flutter-autoroll@skia.org Roll Skia from ceaeef84b8a3 to dbf0829114ee (15 revisions) (flutter/engine#43370)\n2023-07-01 bdero@google.com [Impeller] Add explicit color filter types to Aiks. (flutter/engine#43342)\n2023-07-01 skia-flutter-autoroll@skia.org Roll Dart SDK from 2d98d9e27dae to f00f7363f4bf (1 revision) (flutter/engine#43354)\n\nAlso rolling transitive DEPS:\n  fuchsia/sdk/core/mac-amd64 from cytps4RRhs8- to 8YulTHvG-Jg3\n\nIf this roll has caused a breakage, revert this CL and stop the roller\nusing the controls here:\nhttps://autoroll.skia.org/r/flutter-engine-flutter-autoroll\nPlease CC aaclarke@google.com,rmistry@google.com,zra@google.com on the revert to ensure that a human\nis aware of the problem.\n\nTo file a bug in Flutter: https://github.com/flutter/flutter/issues/new/choose\n\nTo report a problem with the AutoRoller itself, please file a bug:\nhttps://bugs.chromium.org/p/skia/issues/entry?template=Autoroller+Bug\n\nDocumentation for the AutoRoller is here:\nhttps://skia.googlesource.com/buildbot/+doc/main/autoroll/README.md\n",
      "reactions": {
        "url":
            "https://api.github.com/repos/flutter/flutter/issues/129979/reactions",
        "total_count": 0,
        "+1": 0,
        "-1": 0,
        "laugh": 0,
        "hooray": 0,
        "confused": 0,
        "heart": 0,
        "rocket": 0,
        "eyes": 0
      },
      "timeline_url":
          "https://api.github.com/repos/flutter/flutter/issues/129979/timeline",
      "performed_via_github_app": null,
      "state_reason": null,
      "score": 1.0
    }
  ]
}
''';
