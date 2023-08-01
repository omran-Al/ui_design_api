import 'package:flutter/material.dart';

class BuiledItems extends StatelessWidget {
  dynamic articles;
  BuiledItems(this.articles);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // navigateTo(context, WebViewScreen(url: articles['url']));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: articles['urlToImage'] != null
                    ? DecorationImage(
                        image: NetworkImage('${articles['urlToImage']}'),
                        fit: BoxFit.cover,
                      )
                    : const DecorationImage(
                        image: NetworkImage(
                            'https://a57.foxnews.com/static.foxbusiness.com/foxbusiness.com/content/uploads/2023/05/0/0/chappelle.jpg?ve=1&tl=1'),
                        fit: BoxFit.fill),
              ),
            ),
            const SizedBox(width: 20.0),
            Expanded(
              child: Container(
                height: 120.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${articles['title']}',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      '${articles['publishedAt']}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
