/*
 * Copyright (c) 2009-2019, b3log.org & hacpai.com
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.b3log.latke.servlet.handler;

import org.b3log.latke.Keys;
import org.b3log.latke.logging.Level;
import org.b3log.latke.logging.Logger;
import org.b3log.latke.servlet.RequestContext;
import org.b3log.latke.servlet.advice.ProcessAdvice;
import org.b3log.latke.servlet.advice.RequestProcessAdviceException;
import org.b3log.latke.servlet.annotation.RequestProcessing;
import org.b3log.latke.servlet.function.ContextHandler;
import org.b3log.latke.servlet.renderer.AbstractResponseRenderer;
import org.b3log.latke.servlet.renderer.JsonRenderer;
import org.json.JSONObject;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Before processing method ({@link ContextHandler#handle(RequestContext)} or method annotated {@link RequestProcessing}).
 *
 * @author <a href="http://88250.b3log.org">Liang Ding</a>
 * @version 1.0.1.0, Dec 8, 2018
 * @since 2.4.34
 */
public class BeforeHandleHandler implements Handler {

    /**
     * Logger.
     */
    private static final Logger LOGGER = Logger.getLogger(BeforeHandleHandler.class);

    @Override
    public void handle(final RequestContext context) throws Exception {
        final MatchResult result = (MatchResult) context.attr(RouteHandler.MATCH_RESULT);

        final ContextHandlerMeta contextHandlerMeta = result.getContextHandlerMeta();
        final List<AbstractResponseRenderer> rendererList = result.getRendererList();

        try {
            final List<ProcessAdvice> beforeRequestProcessAdvices = contextHandlerMeta.getBeforeRequestProcessAdvices();
            for (final ProcessAdvice beforeRequestProcessAdvice : beforeRequestProcessAdvices) {
                beforeRequestProcessAdvice.doAdvice(context);
            }
        } catch (final RequestProcessAdviceException e) {
            final JSONObject exception = e.getJsonObject();
            final String msg = exception.optString(Keys.MSG);
            LOGGER.log(Level.WARN, "Occurred an exception before request processing: " + msg);

            final int statusCode = exception.optInt(Keys.STATUS_CODE, -1);
            if (-1 != statusCode && HttpServletResponse.SC_OK != statusCode) {
                final HttpServletResponse response = context.getResponse();
                response.sendError(statusCode, msg);
            } else {
                final JsonRenderer ret = new JsonRenderer();
                ret.setJSONObject(exception);
                context.setRenderer(ret);
            }

            context.abort();

            return;
        }

        for (final AbstractResponseRenderer renderer : rendererList) {
            renderer.preRender(context);
        }

        context.handle();
    }
}
