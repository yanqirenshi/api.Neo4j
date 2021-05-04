import React from 'react';
import {
    Sections, Section, Contents, Syntax,
} from '../../../components/Common.js';


function argumentsContents () {
    return (
        <>
          <Section title="statements" level={5}>
            <Contents>
            </Contents>
          </Section>

          <Section title="commit-uri" level={5}>
            <Contents>
            </Contents>
          </Section>

          <Section title="commit" level={5}>
            <Contents>
              <p>実行する <code>statements</code> でコミットする場合は t を指定します。</p>
              <p>デフォルト値は <code>t</code> です。</p>
              <p>この値が <code>nil</code> の場合、実行した <code>statements</code> はトランザクション実行となりコミットされていない状態になります。</p>
              <p>別途 <code>commit-uri</code> でコミットする必要があります。</p>
            </Contents>
          </Section>

          <Section title="adjuster" level={5}>
            <Contents>
              <p>API から取得した値を変換するための関数を指定します。</p>
              <p>この関数では必ず値を返す必要があります。</p>
              <p>この関数は行単位で実行されます。</p>
              <p>関数の定義は以下の通りです。</p>
              <p><pre>{"#'(lambda (row columns) ....)"}</pre></p>
            </Contents>
          </Section>

          <Section title="nature" level={5}>
            <Contents>
              <p>返す値 <code>results</code> の形式を指定します。</p>
              <p>t の場合は <a href="https://neo4j.com/docs/http-api/current/actions/begin-a-transaction/">Neo4j の API が返す値</a> をそのまま返します。</p>
            </Contents>
          </Section>

          <Section title="db" level={5}>
            <Contents>
            </Contents>
          </Section>

          <Section title="user" level={5}>
            <Contents>
            </Contents>
          </Section>

          <Section title="password" level={5}>
            <Contents>
            </Contents>
          </Section>
        </>
    );
}

export default function Http () {
    const prestyle = {
        fontSize:14,
        lineHeight: '14px',
    };

    return (
        <Section title="http">
          <Contents>
            <Syntax symbol="http"
                    keys={['statements', 'commit-uri', 'commit', 'adjuster', 'nature', 'db', 'user', 'password']}
                    results={['result']}/>
          </Contents>

          <Section title="Values" level={4}>
            <Section title="result" level={5}>
              <Contents>
              </Contents>
            </Section>
          </Section>

          <Section title="Arguments" level={4}>
            {argumentsContents()}
          </Section>

        </Section>
    );
}
