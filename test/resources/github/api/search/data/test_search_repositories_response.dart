/// 以下のコマンドで取得しました :
///
/// ```
/// curl -L \
///  -H "Accept: application/vnd.github+json" \
///  -H "X-GitHub-Api-Version: 2022-11-28" \
///  "https://api.github.com/search/repositories?q=flutter&per_page=1"
/// ```
const testSearchRepositoriesResponse = r'''
{
  "total_count": 549751,
  "incomplete_results": false,
  "items": [
    {
      "id": 31792824,
      "node_id": "MDEwOlJlcG9zaXRvcnkzMTc5MjgyNA==",
      "name": "flutter",
      "full_name": "flutter/flutter",
      "private": false,
      "owner": {
        "login": "flutter",
        "id": 14101776,
        "node_id": "MDEyOk9yZ2FuaXphdGlvbjE0MTAxNzc2",
        "avatar_url": "https://avatars.githubusercontent.com/u/14101776?v=4",
        "gravatar_id": "",
        "url": "https://api.github.com/users/flutter",
        "html_url": "https://github.com/flutter",
        "followers_url": "https://api.github.com/users/flutter/followers",
        "following_url":
            "https://api.github.com/users/flutter/following{/other_user}",
        "gists_url": "https://api.github.com/users/flutter/gists{/gist_id}",
        "starred_url":
            "https://api.github.com/users/flutter/starred{/owner}{/repo}",
        "subscriptions_url":
            "https://api.github.com/users/flutter/subscriptions",
        "organizations_url": "https://api.github.com/users/flutter/orgs",
        "repos_url": "https://api.github.com/users/flutter/repos",
        "events_url": "https://api.github.com/users/flutter/events{/privacy}",
        "received_events_url":
            "https://api.github.com/users/flutter/received_events",
        "type": "Organization",
        "site_admin": false
      },
      "html_url": "https://github.com/flutter/flutter",
      "description":
          "Flutter makes it easy and fast to build beautiful apps for mobile and beyond",
      "fork": false,
      "url": "https://api.github.com/repos/flutter/flutter",
      "forks_url": "https://api.github.com/repos/flutter/flutter/forks",
      "keys_url": "https://api.github.com/repos/flutter/flutter/keys{/key_id}",
      "collaborators_url":
          "https://api.github.com/repos/flutter/flutter/collaborators{/collaborator}",
      "teams_url": "https://api.github.com/repos/flutter/flutter/teams",
      "hooks_url": "https://api.github.com/repos/flutter/flutter/hooks",
      "issue_events_url":
          "https://api.github.com/repos/flutter/flutter/issues/events{/number}",
      "events_url": "https://api.github.com/repos/flutter/flutter/events",
      "assignees_url":
          "https://api.github.com/repos/flutter/flutter/assignees{/user}",
      "branches_url":
          "https://api.github.com/repos/flutter/flutter/branches{/branch}",
      "tags_url": "https://api.github.com/repos/flutter/flutter/tags",
      "blobs_url":
          "https://api.github.com/repos/flutter/flutter/git/blobs{/sha}",
      "git_tags_url":
          "https://api.github.com/repos/flutter/flutter/git/tags{/sha}",
      "git_refs_url":
          "https://api.github.com/repos/flutter/flutter/git/refs{/sha}",
      "trees_url":
          "https://api.github.com/repos/flutter/flutter/git/trees{/sha}",
      "statuses_url":
          "https://api.github.com/repos/flutter/flutter/statuses/{sha}",
      "languages_url": "https://api.github.com/repos/flutter/flutter/languages",
      "stargazers_url":
          "https://api.github.com/repos/flutter/flutter/stargazers",
      "contributors_url":
          "https://api.github.com/repos/flutter/flutter/contributors",
      "subscribers_url":
          "https://api.github.com/repos/flutter/flutter/subscribers",
      "subscription_url":
          "https://api.github.com/repos/flutter/flutter/subscription",
      "commits_url":
          "https://api.github.com/repos/flutter/flutter/commits{/sha}",
      "git_commits_url":
          "https://api.github.com/repos/flutter/flutter/git/commits{/sha}",
      "comments_url":
          "https://api.github.com/repos/flutter/flutter/comments{/number}",
      "issue_comment_url":
          "https://api.github.com/repos/flutter/flutter/issues/comments{/number}",
      "contents_url":
          "https://api.github.com/repos/flutter/flutter/contents/{+path}",
      "compare_url":
          "https://api.github.com/repos/flutter/flutter/compare/{base}...{head}",
      "merges_url": "https://api.github.com/repos/flutter/flutter/merges",
      "archive_url":
          "https://api.github.com/repos/flutter/flutter/{archive_format}{/ref}",
      "downloads_url": "https://api.github.com/repos/flutter/flutter/downloads",
      "issues_url":
          "https://api.github.com/repos/flutter/flutter/issues{/number}",
      "pulls_url":
          "https://api.github.com/repos/flutter/flutter/pulls{/number}",
      "milestones_url":
          "https://api.github.com/repos/flutter/flutter/milestones{/number}",
      "notifications_url":
          "https://api.github.com/repos/flutter/flutter/notifications{?since,all,participating}",
      "labels_url":
          "https://api.github.com/repos/flutter/flutter/labels{/name}",
      "releases_url":
          "https://api.github.com/repos/flutter/flutter/releases{/id}",
      "deployments_url":
          "https://api.github.com/repos/flutter/flutter/deployments",
      "created_at": "2015-03-06T22:54:58Z",
      "updated_at": "2023-07-06T17:30:41Z",
      "pushed_at": "2023-07-06T18:44:59Z",
      "git_url": "git://github.com/flutter/flutter.git",
      "ssh_url": "git@github.com:flutter/flutter.git",
      "clone_url": "https://github.com/flutter/flutter.git",
      "svn_url": "https://github.com/flutter/flutter",
      "homepage": "https://flutter.dev",
      "size": 262858,
      "stargazers_count": 154797,
      "watchers_count": 154797,
      "language": "Dart",
      "has_issues": true,
      "has_projects": true,
      "has_downloads": true,
      "has_wiki": true,
      "has_pages": false,
      "has_discussions": false,
      "forks_count": 25614,
      "mirror_url": null,
      "archived": false,
      "disabled": false,
      "open_issues_count": 11631,
      "license": {
        "key": "bsd-3-clause",
        "name": "BSD 3-Clause \"New\" or \"Revised\" License",
        "spdx_id": "BSD-3-Clause",
        "url": "https://api.github.com/licenses/bsd-3-clause",
        "node_id": "MDc6TGljZW5zZTU="
      },
      "allow_forking": true,
      "is_template": false,
      "web_commit_signoff_required": false,
      "topics": [
        "android",
        "app-framework",
        "cross-platform",
        "dart",
        "dart-platform",
        "desktop",
        "flutter",
        "flutter-package",
        "fuchsia",
        "ios",
        "linux-desktop",
        "macos",
        "material-design",
        "mobile",
        "mobile-development",
        "skia",
        "web",
        "web-framework",
        "windows"
      ],
      "visibility": "public",
      "forks": 25614,
      "open_issues": 11631,
      "watchers": 154797,
      "default_branch": "master",
      "score": 1.0
    }
  ]
}
''';
