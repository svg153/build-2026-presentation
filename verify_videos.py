#!/usr/bin/env python3
"""Verify all YouTube video IDs and Twitter/X links in the presentation."""
import re
import sys
import os

# We'll use curl to check YouTube video IDs work
import subprocess

def extract_youtube_ids(html):
    """Extract all YouTube video URLs from the HTML."""
    pattern = r'https?://www\.youtube\.com/watch\?v=([^\s"\']+)'
    urls = re.findall(pattern, html)
    return urls

def extract_x_urls(html):
    """Extract all X/Twitter URLs from the HTML."""
    pattern = r'https?://(?:x|twitter)\.com/i/status/(\d+)'
    urls = re.findall(pattern, html)
    return urls

def check_youtube_video(video_id):
    """Check if a YouTube video ID is valid by trying to fetch it."""
    if video_id == 'NOT_FOUND_NEED_ID':
        return False, "Placeholder ID not found"
    
    # Try to get video info via oembed (free, no API key needed)
    url = f"https://www.youtube.com/oembed?url=https://www.youtube.com/watch?v={video_id}&format=json"
    try:
        result = subprocess.run(
            ['curl', '-s', '-o', '/dev/null', '-w', '%{http_code}', url],
            capture_output=True, text=True, timeout=10
        )
        status = result.stdout.strip()
        if status == '200':
            return True, "OK"
        else:
            return False, f"HTTP {status}"
    except Exception as e:
        return False, str(e)

def main():
    presentation_path = '/root/workspace/build-2026-presentation/microsoft-build-2026.marp.html'
    
    with open(presentation_path, 'r') as f:
        content = f.read()
    
    # Check YouTube videos
    print("=" * 70)
    print("📹 YOUTUBE VIDEO IDS")
    print("=" * 70)
    
    youtube_ids = extract_youtube_ids(content)
    print(f"\nFound {len(youtube_ids)} YouTube video IDs:\n")
    
    invalid_youtube = []
    for video_id in youtube_ids:
        ok, msg = check_youtube_video(video_id)
        status = "✅" if ok else "❌"
        print(f"  {status} {video_id} — {msg}")
        if not ok:
            invalid_youtube.append(video_id)
    
    # Check Twitter/X links
    print(f"\n{'=' * 70}")
    print("🐦 TWITTER/X LINKS")
    print("=" * 70)
    
    x_statuses = extract_x_urls(content)
    print(f"\nFound {len(x_statuses)} X/Twitter status IDs:\n")
    
    invalid_x = []
    for status_id in x_statuses:
        # Just verify it's not a placeholder
        if status_id.isdigit() and len(status_id) > 10:
            print(f"  ✅ {status_id} — Looks valid (long enough)")
        else:
            print(f"  ❌ {status_id} — Looks suspicious")
            invalid_x.append(status_id)
    
    # Summary
    print(f"\n{'=' * 70}")
    print("📊 SUMMARY")
    print("=" * 70)
    print(f"  YouTube videos: {len(youtube_ids) - len(invalid_youtube)}/{len(youtube_ids)} valid")
    print(f"  X/Twitter links: {len(x_statuses) - len(invalid_x)}/{len(x_statuses)} valid")
    
    if invalid_youtube:
        print(f"\n❌ INVALID YOUTUBE IDs: {', '.join(invalid_youtube)}")
    else:
        print(f"\n✅ All YouTube video IDs are valid!")
    
    return len(invalid_youtube)

if __name__ == '__main__':
    sys.exit(main())
